use std::{ net::{ TcpListener, TcpStream }, io::{ BufReader, BufRead, Write } };

pub struct Server {
  address: String,
  routes: Vec<[String; 2]>,
}

impl Server {
  pub fn new(address: String) -> Server {
    Server { address, routes: vec![] }
  }

  pub fn add_route(&mut self, request: String, response: String) {
    self.routes.push([request, response]);
  }

  fn handle_stream(&mut self, mut stream: TcpStream) {
    let stream_buffer: BufReader<&TcpStream> = BufReader::new(&stream);
    let request: String = stream_buffer.lines().next().unwrap().unwrap();
    println!("Request: {request}");

    for route in self.routes.clone() {
      if format!("GET {} HTTP/1.1", route[0]) == request.as_str() {
        let response: String = format!("HTTP/1.1 200 OK\r\n\r\n{}", route[1]);
        stream.write_all(response.as_bytes()).unwrap();

        println!("Response: {}...", route[1].get(0..20).unwrap());
        return;
      }
    }

    stream.write_all("HTTP/1.1 200 OK\r\n\r\nNothing Here!".as_bytes()).unwrap();
    println!("Response: Nothing Here!");
  }

  pub fn listen(&mut self) {
    let listener: TcpListener = TcpListener::bind(&self.address).unwrap();
    println!("Server listening on {}!", self.address);

    for stream in listener.incoming() {
      self.handle_stream(stream.unwrap());
    }
  }
}