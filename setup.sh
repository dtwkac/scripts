sudo apt update && \
sudo apt upgrade -y && \
sudo apt autoremove -y && \
sudo apt install -y vim g++ cmake cgdb git wget unzip tmux docker.io language-pack-zh-hans && \
sudo update-locale LANG=zh_CN.UTF-8 && \
echo "filetype plugin indent on" >> ~/.vimrc && \
echo "set expandtab" >> ~/.vimrc && \
echo "set shiftwidth=4" >> ~/.vimrc && \
echo "machine github.com" >> ~/.netrc && \
echo "  login " >> ~/.netrc && \
echo "  password " >> ~/.netrc && \
echo "machine api.github.com" >> ~/.netrc && \
echo "  login " >> ~/.netrc && \
echo "  password " >> ~/.netrc && \
echo >> ~/.netrc && \
echo "machine gitee.com" >> ~/.netrc && \
echo "  login " >> ~/.netrc && \
echo "  password " >> ~/.netrc && \
echo "machine api.gitee.com" >> ~/.netrc && \
echo "  login " >> ~/.netrc && \
echo "  password " >> ~/.netrc && \
echo ${win_id_rsa_pub} >> ~/.ssh/authorized_keys && \
mkdir ~/tools && \
cd ~/tools && \
anaconda_version=2024.02-1-Linux-x86_64 && \
wget https://repo.anaconda.com/archive/Anaconda3-${anaconda_version}.sh && \
bash Anaconda3-${anaconda_version}.sh -b -p ~/tools/anaconda3 && \
rm Anaconda3-${anaconda_version}.sh && \
source ~/tools/anaconda3/bin/activate && \
conda create -y -n dev python=3.12.0 && \
conda deactivate && \
echo "alias c='source ~/tools/anaconda3/bin/activate && conda activate dev'" >> ~/.bash_aliases && \
echo "alias p='python3'" >> ~/.bash_aliases && \
git clone https://github.com/dtwkac/yarx.git && \
cp yarx/yarx.zip ~/tools && \
rm -rf yarx && \
echo "" | sha256sum | awk '{print $1}' | xargs -I {} unzip -P {} yarx.zip && \
rm yarx.zip && \
cd xray && \
unzip Xray-linux-64.zip && \
rm Xray-linux-64.zip && \
sed -i '52s/""/""/' config.json && \
sed -i '53s/11111//' config.json && \
sed -i '56s/""/""/' config.json && \
tmux new -d -s xray && \
sleep 1 && \
tmux send -t xray "~/tools/xray/xray" Enter && \
sleep 1 && \
echo "alias x='export http_proxy=http://127.0.0.1:10809 && export https_proxy=http://127.0.0.1:10809'" >> ~/.bash_aliases && \
cd ~/tools && \
go_version=1.22.0 && \
https_proxy=http://127.0.0.1:10809 wget https://go.dev/dl/go${go_version}.linux-amd64.tar.gz && \
tar -zxvf go${go_version}.linux-amd64.tar.gz && \
rm go${go_version}.linux-amd64.tar.gz && \
sed -i "/alias c=/a alias go='~/tools/go/bin/go'" ~/.bash_aliases && \
source ~/.bash_aliases && \
cd && \
mkdir workspace
