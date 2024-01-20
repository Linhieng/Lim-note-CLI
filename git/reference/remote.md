# git 与云端的交互

为了区分本地分支和远程分支，远程分支的命名格式为 `<remote-name>/<branch-name>`，默认使用 `origin` 作为远程仓库名称。由于日常生活中我们基本只会用 origin 作为远程仓库的别名，所以下面命令会直接写成 origin，则不会写成变量的形式。

git 与云端的交互可以概括为两点：

- 向远程仓库推送数据
- 从远程仓库拉取数据

在推送和拉取的过程中，git 需要知道本地分支和远程分支之间的对应关系。而在 git 中，分支之间可以进行追踪（tract）。本地分支追踪远程分支，该远程分支称为该本地分支的上游（upstream）。

> 在 branch 命令中有 `--track` 和 `--set-upstream-to` 两种方式来设置追踪，它们的效果其实是一样的。通常 `--track` 是在本地分支之间设置，而 `--set-upstream-to` 是在本地与远程分支之间设置。 —— 来自 ChatGPT

## 追踪 track

```sh
git branch --track <branch-name> <start-point>
git branch (-u | --set-upstream-to) <upstream> [<branch>]
git checkout (-b | -B) <new-branch> <start-point>
```

## clone

## fetch

fetch 的核心工作：

- 从远程仓库下载本地仓库中缺失的提交记录
- 更新远程分支指针(如 origin/main)

注意，fetch 并不会改变本地仓库的状态、不会更新本地分支，不会修改文件内容。可以将 fetch 理解为单纯的下载操作。想要将下载下来的数据同步到本地仓库中，需要进行合并操作——比如 `cherry-pick`, `rebase`, `merge` 等命令。

```sh
git fetch
```

## pull

pull 虽方便，但当你想将本地的多个副分支合并到云端主分支，并且偏爱 rebase 时，推荐使用 fetch，因为 rebase 支持指定“基”。

```sh
$ git pull
# fetch 和 merge 命令的缩写。比如 git fetch && git merge origin/main

$ git pull --rebase
# fetch 和 rebase 命令的缩写。比如 git fetch && git rebase origin/main

```

## push

```sh
$ git push origin <branch-name>
# 将本地分支 <branch-name> 分支推送到云端
# 若本地与远程的分支名不相同，则可以使用以下命令格式
git push origin <local-branch-name>:<remote-branch-name>
```

## remote
