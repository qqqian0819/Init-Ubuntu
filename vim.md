# 打造IDE般的vim  
### 效果图  
![vim](./image/vim.png)  
### 功能  
* 支持鼠标点击，支持Ctrl+c,Ctrl+v,Ctrl+z,Ctrl+a...  
* 支持语法高亮，ement，git，markdown...
* 打造IDE
### 步骤
1 安装vim
```bash
   sudo apt-get install vim
```
2 安装插件管理器  [vim-plug](https://github.com/junegunn/vim-plug)  
```bash
    cd ~/ && mkdir -p .vim/autoload  
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
```
3 配置vimrc
```bash
    cd /etc/vim  
    vim vimrc
```
4 [配置文件](./vimrc)   
```bash
     可直接将此配置复制到vimrc中
```
5 安装插件  
```bash
    vim  
    :PlugInstall  
```
6 主题(以vim-colors-solarized为例)
```bash
    cd ~/.vim  
    mkdir colors  
    cd ./plugged/vim-colors-solarized  
    cp ./colors/solarized.md ../../colors
```  
7 代码补全不生效
```bash
    sudo apt-get install build-essential cmake3  
    sudo apt-get install python-dev python3-dev
    cd ~/.vim/plugged/YouCompleteMe
    ./install.py --js-completer // js补全
```
### 详解
vim手册  
```bash 
    vimtutor  
 ```
插件介绍   
(待补充)
