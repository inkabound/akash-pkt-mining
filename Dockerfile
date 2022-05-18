FROM rust:slim

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git -y && \
git clone https://github.com/cjdelisle/packetcrypt_rs && \
cd packetcrypt_rs && \
cargo build --release
