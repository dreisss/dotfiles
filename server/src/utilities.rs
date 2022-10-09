use std::env::args;

pub fn read_files_paths() -> Vec<String> {
  let mut args_input: Vec<String> = args().collect();
  args_input.remove(0);

  return args_input;
}