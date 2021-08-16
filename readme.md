#### Produces a binary file through the file `multiboot_header.asm`
with the following command:

```sh
nasm multiboot_header.asm
```
```sh
hexdump -x multiboot_header
```

Output example:

```sh
0000000    50d6    e852    0000    0000    0018    0000    af12    17ad
0000010    0000    0000    0008    0000
0000018
```