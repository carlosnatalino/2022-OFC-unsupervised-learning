# Create the build container to compile the hello world program
FROM rust:1.55-buster
WORKDIR /app
ADD . ./
RUN apt-get update && apt-get install -y wget curl vim nano && rm -rf /var/lib/apt/lists/*
RUN cargo build --release

EXPOSE 50051
EXPOSE 50052
CMD ["/app/target/release/server"]
