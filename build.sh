sudo apt update && \
sudo apt upgrade -y && \
sudo apt autoremove -y && \
sudo apt install -y git g++ libmpc-dev make flex && \
cd ~/workspace && \
git clone https://github.com/gcc-mirror/gcc.git && \
cd gcc && \
mkdir build && \
cd build && \
../configure --disable-multilib && \
make -j$(nproc) && \
sudo apt install -y automake flex texinfo libreadline-dev && \
cd ~/workspace && \
git clone https://github.com/cgdb/cgdb.git && \
cd cgdb && \
./autogen.sh && \
mkdir build && \
cd build && \
../configure && \
make -j$(nproc) && \
sudo apt install -y build-essential gdb lcov pkg-config \
    libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
    libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
    lzma lzma-dev tk-dev uuid-dev zlib1g-dev && \
cd ~/workspace && \
git clone https://github.com/python/cpython.git && \
cd cpython && \
mkdir build && \
cd build && \
../configure --with-pydebug && \
make -j$(nproc) && \
cd ~/workspace && \
git clone https://github.com/XTLS/Xray-core.git && \
cd Xray-core && \
go mod download && \
CGO_ENABLED=0 go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main && \
sudo apt install -y wget && \
cd ~/workspace && \
wget https://www.informit.com/content/images/9780321714114/downloads/GCC_pre_C11.zip && \
unzip GCC_pre_C11.zip -d c-plus-plus-primer && \
rm GCC_pre_C11.zip && \
git clone https://gitee.com/dtwkac/playground.git && \
git clone https://gitee.com/dtwkac/intel.git && \
sudo apt install -y aapt && \
wget https://telegram.org/dl/android/apk && \
aapt dump badging apk | grep versionName && \
rm apk
