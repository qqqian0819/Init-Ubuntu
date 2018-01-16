### 相关介绍
* [github](https://github.com/moby/moby)
* [what is docker](https://www.docker.com/what-docker)
* [docker docs](https://docs.docker.com/)
* [docker从入门到实践](https://www.docker.com/what-docker)
* [runoob](http://www.runoob.com/docker/docker-tutorial.html)
### 安装docker   
[官方安装教程](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce-1)    
1. sudo apt-get update   
2. sudo apt-get install \   
    apt-transport-https \   
    ca-certificates \   
    curl \   
    software-properties-common  
3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -    
4. sudo apt-key fingerprint 0EBFCD88    
5. sudo add-apt-repository \    
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \   
   $(lsb_release -cs) \   
   stable"
6. sudo apt-get update   
7. sudo apt-get install docker-ce    
__注意__：
* ce,ee区别: docker-ce(Community Edition 个人版) 和 docker-ee(Enterprise Edition 企业版)

* 报错：   
An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 Release: The following signatures were invalid: KEYEXPIRED 1515625755
W: The repository 'http://ppa.launchpad.net/fcitx-team/nightly/ubuntu xenial Release' does not have a Release file.
W: Failed to fetch http://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/3.4/Release.gpg  The following signatures were invalid: KEYEXPIRED 1515625755
E: Failed to fetch http://ppa.launchpad.net/fcitx-team/nightly/ubuntu/dists/xenial/main/binary-amd64/Packages  404  Not Found
W: Some index files failed to download. They have been ignored, or old ones used instead.   
解决：
[overflow](https://askubuntu.com/questions/131601/gpg-error-release-the-following-signatures-were-invalid-badsig/136838)   
1. sudo apt-get clean   
2. sudo mv /var/lib/apt/lists /tmp   
3. sudo mkdir -p /var/lib/apt/lists/partial   
4. sudo apt-get clean   
5. sudo apt-get update   
### [常见命令](http://www.runoob.com/docker/docker-command-manual.html)
```
今天使用过的几个命令   
```

* __运行(默认的hello-world)__：  
sudo service docker start   
docker run hello-world    
* __查看版本__：   
* sudo docker version   
* __列出本地镜像__：   
 sudo docker images
* __列出容器__：    
sudo docker ps [options]    
    ```
    -a :显示所有的容器，包括未运行的。   
    -q :静默模式，只显示容器编号。
    ```
* [文档](http://www.runoob.com/docker/docker-command-manual.html)
### 删除默认的hello-world:
* __rm删除容器__：    
sudo docker rm $(sudo docker ps -aq)
* __rmi删除本地镜像__:   
sudo docker rmi hello-world

### 导入镜像
    如果在当前文件下面有一个zlms11.tar的镜像压缩文件,
    而且
    是为你现在手上有的项目量身订做的镜像。

* sudo docker load < ./zlms11.tar 
* mkdir /tmp/hostinfo  
* echo "there.is.yourself.ip" > /tmp/hostinfo/controller_ip   __(ifconfig查询自己的ip)__
* echo "controller" > /tmp/hostinfo/controller_hostname
* echo "172.17.0.1" > /tmp/hostinfo/vlab_ip
* echo "172.17.0.2" > /tmp/hostinfo/zlms_ip
* sudo docker run -it -d -v /tmp/hostinfo:/tmp/hostinfo --name zlms -p 8080:80 zlms:v12 /sbin/setup.sh      (将容器的80端口映射到主机的8080端口)
  
最后：浏览器打开 http://localhost:8080

### 残留问题
本地文件修改后，需要重启docker相当麻烦...留坑明天待填......
