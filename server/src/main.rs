mod utilities;
use utilities::read_files_paths;

fn main() {
  let files_path: Vec<String> = read_files_paths();
  println!("{:?}", files_path);
}
