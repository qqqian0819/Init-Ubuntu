# 常用git总结
* ### 牢记git --help
* ### git六剑客
```bash  
 git clone
 git status
 git add
 git commit
 git pull
 git push  
```
* ### git其它
```Bash
 git checkout <branch> // 切换分支(切的分支改变代码未提交就切换到dev分支，以前好像貌似会提示需要先处理，现在我确定是直接将改变带回dev分支。所以需要先在分支上提交代码，再切换dev，才能互不影响的工作)
 git checkout -b <branch> // 创建并切换分支
 git checkout -- file // 从暂存区去除
 git diff file // 查看改变
 git merge <branch> // 合并分支
 git reste --hard(危险操作) // 退回版本 --hard直接覆盖掉，比较可怕的操作
 git rm file // 从版本库中删除
 git stash // 暂存
 git log // 查看git日志
 ...[--help]
```
* ### 经常发生的场景(待完善)
 1 同一个电脑多个git账号  
 2 从其它仓库fork到自己仓库   
 3 已经push代码但是又有新代码需要提交，仍属于上一个commit的内容    
 4 已经push代码，但是需要撤回commit重新编辑commit信息  
 5 忘记pull代码直接push与仓库代码产生冲突  
 6 本地切分支
