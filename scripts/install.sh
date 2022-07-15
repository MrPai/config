#!/usr/bin/env bash
set -e
DOCKER_COMPOSE_VERSION=v2.6.1

echo "**************************************"
echo "[+] START: Install required packages"
apt update
apt install -y build-essential
#sudo apt update && sudo apt install -y cmake pkg-config libssl-dev git build-essential curl libpq-dev
#（clang libclang-dev libmysqlclient-dev）
apt install -y git clang curl libssl-dev llvm libudev-dev make protobuf-compiler

echo "**************************************"
echo "[+] START: Install Rust"
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
source $HOME/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly

echo "**************************************"
echo "[+] START: Install Docker & Docker-compose"
curl -fsSL https://get.docker.com | bash -s docker
curl -L "https://github.com/docker/compose/releases/download/$(DOCKER_COMPOSE_VERSION)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "**************************************"
echo "[+] START: Install Node & Yarn"
apt install -y nodejs npm
npm install -g n
n stable
# hash -r  (for bash, zsh, ash, dash, and ksh)
# rehash   (for csh and tcsh)
hash -r
npm install --location=global yarn
yarn global add @open-web3/parachain-launch

echo "**************************************"
echo "[+] START: Config python3"
apt install python-is-python3

echo "**************************************"
echo "[+] START: Install srtool"
cargo install --git https://github.com/chevdor/srtool-cli

echo "[+] START: Install ganache hardhat"
npm install ganache --location=global
npm install --save-dev hardhat --location=global
curl -L https://foundry.paradigm.xyz | bash
#source $HOME/.bashrc
$HOME/.foundry/bin/foundryup
cast --version

# https://github.com/ohmyzsh/ohmyzsh
# https://ohmyz.sh/#install
apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- -y
zsh
