// extern crate core;

mod bootpack;

use self::bootpack::init_os;
// use core::any;

fn main() {
    println!("Start bootpack");
    init_os();
    println!("End bootpack");
}
