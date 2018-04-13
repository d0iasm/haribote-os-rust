mod bootpack;

fn main() {
    println!("Start bootpack");
    bootpack::init_os();
    println!("End bootpack");
}
