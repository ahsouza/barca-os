
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
Or

Build our kernel for a bare metal target

```sh
cargo build
```


Install tool to compile kernel and boot Operating System

```sh
cargo install bootimage
```

Add the required tools component for bootimage

```sh
rustup component add llvm-tools-preview
```

After installing bootimage and adding the llvm-tools-preview component, we can create a bootable disk image by executing:

```sh
cargo bootimage
```