FROM rustlang/rust:nightly-alpine

RUN apk update && \
    apk add --no-cache bash binaryen gcc git g++ libc-dev zlib-static make npm openssl-dev openssl-libs-static protobuf-dev protoc

RUN rustup target add wasm32-unknown-unknown
RUN rustup component add clippy

# Install dependencies
RUN cargo install cargo-generate
RUN npm install -g sass
RUN npm install -g tailwindcss@latest postcss@latest autoprefixer@latest @tailwindcss/typography@latest @iconify/tailwind daisyui@latest

# Install cargo-leptos
RUN curl --proto '=https' --tlsv1.2 -LsSf https://github.com/leptos-rs/cargo-leptos/releases/latest/download/cargo-leptos-installer.sh | sh

WORKDIR /work

CMD /bin/bash
