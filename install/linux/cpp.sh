set -e

# gcc/g++
sudo apt-get update
sudo apt-get install -y gcc g++

# Cmake
sudo apt install -y cmake

# GoogleTest
sudo apt-get install -y libgtest-dev
cd /usr/src/gtest 
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo cp lib/*.a /usr/lib

