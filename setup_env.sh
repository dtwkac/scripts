sudo apt update && \
sudo apt upgrade -y && \
sudo apt autoremove -y && \
sudo apt install -y vim g++ cmake cgdb git wget unzip tmux docker.io language-pack-zh-hans && \
sudo update-locale LANG=zh_CN.UTF-8 && \
echo 'filetype plugin indent on' >> ~/.vimrc && \
echo 'set expandtab' >> ~/.vimrc && \
echo 'set shiftwidth=4' >> ~/.vimrc && \
echo 'let loaded_matchparen = 1' >> ~/.vimrc && \
echo "au BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g'\\\"\" | endif" >> ~/.vimrc && \
echo 'machine github.com' >> ~/.netrc && \
echo '  login ' >> ~/.netrc && \
echo '  password ' >> ~/.netrc && \
echo 'machine api.github.com' >> ~/.netrc && \
echo '  login ' >> ~/.netrc && \
echo '  password ' >> ~/.netrc && \
echo >> ~/.netrc && \
echo 'machine gitee.com' >> ~/.netrc && \
echo '  login ' >> ~/.netrc && \
echo '  password ' >> ~/.netrc && \
echo 'machine api.gitee.com' >> ~/.netrc && \
echo '  login ' >> ~/.netrc && \
echo '  password ' >> ~/.netrc && \
id_rsa_pub='' && \
echo ${id_rsa_pub} >> ~/.ssh/authorized_keys && \
mkdir ~/tools && \
cd ~/tools && \
anaconda_version='2024.02-1' && \
wget https://repo.anaconda.com/archive/Anaconda3-${anaconda_version}-Linux-x86_64.sh && \
bash Anaconda3-${anaconda_version}-Linux-x86_64.sh -b -p ~/tools/anaconda3 && \
rm Anaconda3-${anaconda_version}-Linux-x86_64.sh && \
source ~/tools/anaconda3/bin/activate && \
conda create -y -n dev python=3.12.0 && \
conda deactivate && \
git clone https://github.com/dtwkac/yarx.git && \
cp yarx/yarx.zip ~/tools && \
rm -rf yarx && \
echo '' | sha256sum | awk '{print $1}' | xargs -I {} unzip -P {} yarx.zip && \
rm yarx.zip && \
cd xray && \
unzip Xray-linux-64.zip && \
rm Xray-linux-64.zip && \
sed -i '52s/""/""/' config.json && \
sed -i '53s/11111//' config.json && \
sed -i '56s/""/""/' config.json && \
tmux new -d -s xray && \
sleep 1 && \
tmux send -t xray '~/tools/xray/xray' Enter && \
cd && \
echo "alias p='python3'" >> ~/.bash_aliases && \
echo "alias c='source ~/tools/anaconda3/bin/activate && conda activate dev'" >> ~/.bash_aliases && \
echo "alias x='export http_proxy=http://127.0.0.1:10809 https_proxy=http://127.0.0.1:10809'" >> ~/.bash_aliases && \
echo "alias ux='unset http_proxy https_proxy'" >> ~/.bash_aliases && \
source ~/.bash_aliases && \
mkdir ~/workspace
