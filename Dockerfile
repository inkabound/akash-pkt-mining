FROM rust:latest as build

WORKDIR /build

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install git -y && \
git clone https://github.com/cjdelisle/packetcrypt_rs --branch develop && \
cd packetcrypt_rs && \
cargo build --release

FROM gcr.io/distroless/cc

EXPOSE 3000

COPY --from=build /build/packetcrypt_rs/target/release/packetcrypt /
ENTRYPOINT ["/packetcrypt", "ann", "-p", "pkt1qt3kpv4dtsrx69ur6pzrlc683zu26czslqu4rlv", "https://stratum.zetahash.com/", "http://pool.pktpool.io/", "http://pool.pkt.world/"]
