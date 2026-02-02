#!/bin/bash



if ! command -v mise &> /dev/null; then
    curl https://mise.jdx.dev/install.sh | sh
fi

sudo systemctl enable docker.service
sudo usermod -aG docker $USER





