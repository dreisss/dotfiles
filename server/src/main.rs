mod utilities;
mod input;
use std::{ io::{ BufReader, BufRead, Write }, net::{ TcpListener, TcpStream }, fs };

use input::Input;

fn main() {
  let input: Input = Input::get();

  let server_address: String = input.get_server_address();
  let files_to_serve: Vec<String> = input.get_files_to_serve();

  let listener: TcpListener = TcpListener::bind(server_address).unwrap();

  let _streams: Vec<_> = listener
    .incoming()
    .map(|stream| handle_stream(stream.unwrap(), &files_to_serve))
    .collect();
}

fn handle_stream(mut stream: TcpStream, routes: &Vec<String>) {
  let stream_buffer = BufReader::new(&stream);
  let request = stream_buffer.lines().next().unwrap().unwrap();
  let mut file_content: String = String::from("Nothing here!");

  for route in routes.into_iter() {
    println!("/{}", route);

    if request == format!("GET /{route} HTTP/1.1") {
      file_content = fs::read_to_string(route).unwrap();
    }
  }

  println!("Request: {request}");

  let response = format!("HTTP/1.1 200 Test\r\n\r\n{file_content}");
  stream.write_all(response.as_bytes()).unwrap();
  println!("Response: {response}")
}
