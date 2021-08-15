
#### Installing Rust nightly version

```sh
rustup default nightly
```

#### back to the stable version

```sh
rustup default stable
``` 


#### Add rust component

```sh
rustup component add rust-src --toolchain nightly-x86_64-pc-windows-msvc
```

#### Build Kernel

```sh
cargo build --target x86_64-barca-os.json
```