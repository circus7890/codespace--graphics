sudo apt-get update
sudo apt-get install -y python3 git cmake build-essential
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
emcc --version
