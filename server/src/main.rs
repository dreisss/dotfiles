mod modules;
use std::fs::read_to_string;

use modules::{ input::Input, server::Server };

fn main() {
  let input: Input = Input::get();
  let server_address: String = input.get_server_address();
  let files_to_serve: Vec<String> = input.get_files_to_serve();

  let mut server: Server = Server::new(server_address);

  for file in files_to_serve {
    let file_content = read_to_string(&file).unwrap();
    server.add_route(format!("/{file}"), file_content);
  }

  server.listen();
}