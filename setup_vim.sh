sudo apt update && \
sudo apt install -y clang-format && \
wget -P ~ https://raw.githubusercontent.com/dtwkac/configs/main/.clang-format && \
echo >> ~/.vimrc && \
echo 'function FormatFile()' >> ~/.vimrc && \
echo '  let l:lines="all"' >> ~/.vimrc && \
echo "  if has('python')" >> ~/.vimrc && \
echo '    pyf /usr/share/vim/addons/syntax/clang-format.py' >> ~/.vimrc && \
echo "  elseif has('python3')" >> ~/.vimrc && \
echo '    py3f /usr/share/vim/addons/syntax/clang-format.py' >> ~/.vimrc && \
echo '  endif' >> ~/.vimrc && \
echo 'endfunction' >> ~/.vimrc && \
echo 'autocmd BufWritePre *.h,*.cc,*.cpp call FormatFile()' >> ~/.vimrc && \
sudo apt install -y curl && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
echo >> ~/.vimrc && \
echo 'call plug#begin()' >> ~/.vimrc && \
echo "Plug 'jiangmiao/auto-pairs'" >> ~/.vimrc && \
echo "Plug 'luochen1990/rainbow'" >> ~/.vimrc && \
echo "Plug 'ycm-core/YouCompleteMe'" >> ~/.vimrc && \
echo 'call plug#end()' >> ~/.vimrc && \
vim -c 'PlugInstall' -c 'qa' && \
sudo apt install -y python3-dev && \
cd ~/.vim/plugged/YouCompleteMe && \
python3 install.py --clangd-completer && \
cd && \
echo >> ~/.vimrc && \
echo 'let g:rainbow_active = 1' >> ~/.vimrc && \
echo 'set completeopt-=preview' >> ~/.vimrc
