FROM rust:slim as build

WORKDIR /build

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git -y && \
git clone https://github.com/cjdelisle/packetcrypt_rs && \
cd packetcrypt_rs

RUN cargo build --release
