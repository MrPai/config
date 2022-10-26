#!/usr/bin/env bash
set -e

echo "**************************************"
echo "[+] START: Install srtool"
cargo install --git https://github.com/chevdor/srtool-cli

echo "[+] START: Install ganache hardhat"
npm install ganache --location=global
npm install --save-dev hardhat --location=global
curl -L https://foundry.paradigm.xyz | bash
$HOME/.foundry/bin/foundryup
$HOME/.foundry/bin/cast --version

source $HOME/.bashrc