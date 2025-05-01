FROM ubuntu
WORKDIR /root
RUN apt update && \
    apt upgrade -y && \
    apt autoremove -y && \
    echo 'y' | unminimize && \
    echo -e "\n6\n70" | apt install -y tzdata && \
    apt install -y sudo man-db command-not-found bash-completion vim g++ cmake cgdb git wget unzip tmux language-pack-zh-hans && \
    apt update && \
    echo >> ~/.bashrc && \
    echo 'if ! shopt -oq posix; then' >> ~/.bashrc && \
    echo '  if [ -f /usr/share/bash-completion/bash_completion ]; then' >> ~/.bashrc && \
    echo '    . /usr/share/bash-completion/bash_completion' >> ~/.bashrc && \
    echo '  elif [ -f /etc/bash_completion ]; then' >> ~/.bashrc && \
    echo '    . /etc/bash_completion' >> ~/.bashrc && \
    echo '  fi' >> ~/.bashrc && \
    echo 'fi' >> ~/.bashrc && \
    echo >> ~/.bashrc && \
    echo "export LANG='zh_CN.UTF-8'" >> ~/.bashrc && \
    echo 'filetype plugin indent on' >> ~/.vimrc && \
    echo 'set expandtab' >> ~/.vimrc && \
    echo 'set shiftwidth=4' >> ~/.vimrc && \
    echo 'let loaded_matchparen = 1' >> ~/.vimrc && \
    echo "au BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g'\\\"\" | endif" >> ~/.vimrc && \
    mkdir ~/tools && \
    cd ~/tools && \
    anaconda_version='2024.02-1' && \
    wget https://repo.anaconda.com/archive/Anaconda3-${anaconda_version}-Linux-x86_64.sh && \
    bash Anaconda3-${anaconda_version}-Linux-x86_64.sh -b -p ~/tools/anaconda3 && \
    rm Anaconda3-${anaconda_version}-Linux-x86_64.sh && \
    . ~/tools/anaconda3/bin/activate && \
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
    echo "alias p='python3'" >> ~/.bash_aliases && \
    echo "alias c='source ~/tools/anaconda3/bin/activate && conda activate dev'" >> ~/.bash_aliases && \
    echo "alias x='export http_proxy=http://127.0.0.1:10809 https_proxy=http://127.0.0.1:10809'" >> ~/.bash_aliases && \
    echo "alias ux='unset http_proxy https_proxy'" >> ~/.bash_aliases

# RUN echo 'root:password' | chpasswd && \
#     apt install -y openssh-server && \
#     echo >> /etc/ssh/sshd_config && \
#     echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
#     echo 'ClientAliveInterval 60' >> /etc/ssh/sshd_config && \
#     echo 'ClientAliveCountMax 3' >> /etc/ssh/sshd_config && \
#     service ssh start

# sudo mkdir -p /etc/systemd/system/docker.service.d && \
# sudo bash -c "echo '[Service]' >> /etc/systemd/system/docker.service.d/http-proxy.conf" && \
# sudo bash -c "echo 'Environment=\"HTTP_PROXY=http://127.0.0.1:10809\"' >> /etc/systemd/system/docker.service.d/http-proxy.conf" && \
# sudo bash -c "echo 'Environment=\"HTTPS_PROXY=http://127.0.0.1:10809\"' >> /etc/systemd/system/docker.service.d/http-proxy.conf" && \
# sudo systemctl daemon-reload && \
# sudo systemctl restart docker && \
# sudo usermod -aG docker $USER

# docker build -t playground .
# docker run --name temp --network host -e DISPLAY -v ~/.Xauthority:/root/.Xauthority:ro --rm -it playground bash
# docker run --name container -h container -v /host/path:/container/path -dit playground bash
# docker run --name container -h container -p 50001:22 -v /host/path:/container/path --shm-size 8g -d playground /usr/sbin/sshd -D
# ssh -p 50001 root@{host_ip}
