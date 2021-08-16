#![no_std] 
#![no_main]

use core::panic::PanicInfo;
/// byte static
static HELLO: &[u8] = b"Hello World!";

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
  loop {}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
///  converting an integer 0xb8000 into a raw pointer primite type
  let vga_buffer = 0xb8000 as *mut u8;
/// LOOP: method to write string 'Hello World!' byte and color byte
  for (i, &byte) in HELLO.iter().enumerate() {
    unsafe {
      *vga_buffer.offset(i as isize * 2) = byte;
      *vga_buffer.offset(i as isize * 2 + 1) = 0xb;
    }
  }

  loop {}
}