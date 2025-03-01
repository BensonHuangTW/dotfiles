# Save the original directory
ORIGINAL_DIR=$(pwd)

# Set a trap to return to the original directory on exit
trap "cd \"$ORIGINAL_DIR\"" EXIT

# gcc/g++
sudo apt-get update
sudo apt-get install -y gcc g++

# Cmake
sudo apt install -y cmake

# GoogleTest
sudo apt-get install -y libgtest-dev
cd /usr/src/gtest 
sudo mkdir -p build
cd build
sudo cmake ..
sudo make
sudo cp lib/*.a /usr/lib

# Return to the original directory
cd "$ORIGINAL_DIR"