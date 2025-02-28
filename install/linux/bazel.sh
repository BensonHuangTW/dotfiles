set -e

mkdir -p ~/Downloads
cd ~/Downloads
# choose proper binary version
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64
sudo mv ~/Downloads/bazelisk-linux-amd64 /usr/local/bin/bazelisk
sudo chmod +x /usr/local/bin/bazelisk
sudo ln -s /usr/local/bin/bazelisk /usr/local/bin/bazel
bazel
