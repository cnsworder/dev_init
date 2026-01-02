# AI强化的emacs

AI强化的emacs环境，经常用来写 `c/c++` `rust` `python` `go` 偶尔写点`HTML`和`javascript`。

## 安装方法

1. 下载项目到本地
2. 执行安装 `./setup.sh`
3. 或者直接建立用户目录下的 `.emacs.d` 的链接.

## 特性描述

1. 使用`swiper/ivy`替换了`helm`
2. 使用`which-key`来做快捷键提示
3. 使用`company`做补全的前端
4. 使用`ycmd`做为代码补全的后端
5. 使用`gruvbox`做为主题
6. 使用`magit`作为git前端

## 演示

### 包管理
![cask](http://ocr26ve0z.bkt.clouddn.com/cask.gif)

### 文件管理
![file](http://ocr26ve0z.bkt.clouddn.com/file.gif)

### 项目管理
![project](http://ocr26ve0z.bkt.clouddn.com/project.gif)

### 搜索
![search](http://ocr26ve0z.bkt.clouddn.com/search.gif)

### 命令补全
![sounsel](http://ocr26ve0z.bkt.clouddn.com/counsel.gif)

### 代码补全
![ycmd](http://ocr26ve0z.bkt.clouddn.com/ycm.gif)


## 语言支持

c/c++:

    + ggtags
    + flycheck
    + google-c-style
    + company-ycmd
    + company-c-headers

python:

    + elpy
    + anacoda-mode

web:

    + web-mode

javascript:

    + js2-mode

-----
作为vim的用户没有添加evil支持是因为觉的没必要，我需要的是一个真正提高效率的emacs环境，如果我需要vim的快速功能我会回去直接使用`vim`了。


## emacs 插件列表

### 基础

| 插件 | 用途 |
| --- | --- |
| gruvbox-theme / dracula-theme / molokai-theme | 配色 |
| neotree | 文件列表 |
| super-save | 自动保存 |
| popwin | 窗口操作 |
| window-numbering | 窗口跳转 |
| dired+ | 目录增强 |
| direx | 打开当前文件目录 |
| crux | 打开应用 |
| undo-tree | 撤销 |
| swiper，counsel | 快捷命令 |
| which-key  | 快捷键提示 |
| exec-path-from-shell | 加载shell的path定义 |
| avy, ag, ace-jump-mode | 搜索 |
| iedit | 多光标 |

### 开发

| 插件 | 用途 |
| --- | --- |
| editorconfig | 代码格式 |
| yasnippet | 代码片段 |
| company，company-ycmd，company-web | 智能补全 |
|  dash-at-point / zeal-at-point | 代码帮助 |
|  xcscope, ggtags | 代码跳转 |
| flycheck, flycheck-ycmd | 代码检查 |
| magit, git-gutter | git |
| smartparens | 自动添加匹配括号 |
| highlight-parentheses | 高亮括号 |
| indent-guide | 缩进线 |
| aggressive-indent | 缩进对齐 |
| expand-region | 扩展选择区域 |
| anaconda-mode, elpy | Python |
| go-mode, company-go | go|
| markdown-mode | markdown |
| js2-mode | javascript |
| web-mode, emmet-mode | web |


