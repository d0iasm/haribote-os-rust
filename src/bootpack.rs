#![feature(asm)]
#![feature(lang_items)]
#![no_main]
#![no_std]

#[lang = "eh_personality"] extern fn eh_personality() {}
#[lang = "panic_fmt"] extern fn panic_fmt() -> ! { loop {} }

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

