use std::env::args;

pub struct Input {
  server_address: String,
  files_to_serve: Vec<String>,
}

impl Input {
  pub fn get() -> Input {
    let input_args: Vec<String> = args().collect();
    return Input {
      server_address: input_args[1].clone(),
      files_to_serve: input_args[2..input_args.len()].to_vec(),
    };
  }

  pub fn get_server_address(&self) -> String {
    (self.server_address).to_string()
  }

  pub fn get_files_to_serve(&self) -> Vec<String> {
    (self.files_to_serve).to_vec()
  }
}
