FROM ubuntu:20.04
LABEL description="This is the devcontainer environment."

RUN apt update && apt install -y git make

RUN git clone https://github.com/mrpai/config && cd config && make install-essential

RUN chsh -s /bin/zsh