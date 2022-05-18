FROM rust:latest as build

WORKDIR /build

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git -y && \
git clone https://github.com/cjdelisle/packetcrypt_rs --branch develop && \
cd packetcrypt_rs && \
cargo build --release
