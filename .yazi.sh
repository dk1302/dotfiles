git clone https://github.com/sxyazi/yazi.git
cd yazi
cargo build --release --locked
mv target/release/yazi target/release/ya /usr/local/bin/
cd ..
rm -rf yazi
