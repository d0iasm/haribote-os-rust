#![feature(asm)]
#![no_main]

// #[no_mangle]
#[cfg(not(any(target_arch = "x86", target_arch = "x86_64")))]
fn hlt() {
    unsafe {
        asm!("hlt");
    }
}

// #[no_mangle]
#[cfg(not(any(target_arch = "x86", target_arch = "x86_64")))]
pub fn init_os() {
    loop {
        hlt();
    }
}
