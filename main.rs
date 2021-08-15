#![no_std] 
#![no_main]

use core::panic::PanicInfo;

/// Function is on Panic
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
