[**rust**]: https://www.rust-lang.org
[**crates.io**]: https://crates.io

# [**Serve Files**](#serve-files)

Simplest local files server. Serve files in a indicated address. Run as below:

```sh
serve localhost:8000 example.html
```

This program has the following inputs:

```sh
serve address file_to_serve [other_files...]
```

## [**Installation**](#installation)

First, if you don't have [**rust**] installed, install it. After installation
follow the steps:

You can install it directly using [**crates.io**] by running the commands below:

```sh
cargo install serve-files
```

**or**, install from source code by running:

```sh
git clone https://github.com/dreisss/.files.git
cd .files/server
cargo install --path .
```
