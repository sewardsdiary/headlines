# Enable strict error handling
$ErrorActionPreference = "Stop"

# Build the Rust project for WebAssembly
cargo build --release --lib -p headlines --target wasm32-unknown-unknown

# Run wasm-bindgen
wasm-bindgen target\wasm32-unknown-unknown\release\headlines.wasm `
--out-dir webapp --no-modules --no-typescript

# Change to the webapp directory
Set-Location webapp

# Start a basic HTTP server (assuming `basic-http-server` is installed via cargo)
basic-http-server --addr 127.0.0.1:3000 .