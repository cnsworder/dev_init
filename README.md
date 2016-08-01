配置文件
=========

配置方法
--------    

```
    git clone git@github.com:cnsworder/dev_init  
    cd dev_init
    ./setup.sh -a
```

### 选项

+ -e 配置emacs
+ -v 配置vim
+ -p 配置python
+ -k 安装软件包
+ -x 安装X11软件包
+ -a 所有配置，不包括zsh
+ -s 安装配置zsh   

说明
-----

  + vim使用vundle进行包管理
  + emacs使用elpa进行包管理  
  
  + 配置说明:[cnsworder Blog] [1]   

展示
-----------
  
  + vim
    
    ![vim](http://img.blog.csdn.net/20131118142641312?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY25zd29yZA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

  + emacs
    
    ![emacs](http://img.blog.csdn.net/20131118142632953?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY25zd29yZA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

  + ranger

    ![ranger](http://img.blog.csdn.net/20131118142648984?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY25zd29yZA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

  + tig

    ![tig](http://img.blog.csdn.net/20140817150603683)

mail:[cnsworder@gmail.com](mailto:cnsowrder@gmail.com)

[1]: http://blog.csdn.net/cnsword  "Blog"

vim使用说明
-------------------

+ `mapleader=;`
+ `<leader>u` 显示隐藏撤销树
+ `<leader>nn` 显示隐藏文件浏览
+ `<leader>tt` 显示隐藏tag
+ `<leader>uu` 更新插件
+ `<leader>n` 显示行号 
+ `<leader>l` 显示符号
+ `<leader>b` 自动换行

+ `<leader>q` 退出 
+ `<leader>qq` 强制退出
+ `<leader>w` 保存文件
+ `<leader>wq` 保存并退出
+ `<leader>qa` 全部退出
+ `<leader>d` 显示缩进列表
+ `<leader>i` 显示缩进线 

emacs使用说明
-----------------

+ `M-x` 指令
+ `C-x C-b` buffer列表 
+ `C-x C-f` 打开文件
+ `C-s` 搜索
+ `C-c C-i` imenu
+ `C-c C-g` git查找
+ `C-c C-a` ag查找
+ `C-c C-e` hippie
+ `C-c C-b` bookmark查找
+ `C-c C-m` 设置bookmark
+ `C-c C-v` 扩展选择区域
+ `C-h v` 变量帮助
+ `C-h f` 函数帮助
+ `C-c g c` git提交
+ `C-c g p` git推送
+ `C-c g f` git拉取
+ `C-c g s` git状态
+ `C-c g d` git比较
+ `C-c p f` 项目文件查找
+ `C-c p a` 项目ag查找
+ `C-c p p` 切换项目
+ `C-c C-p` 插件管理
+ `C-c f` 文件树
+ `C-c s` eshell
+ `C-c e` emmet扩展
+ `C-x C-r` 'recentf-open-files)
+ `C-x C-j` 打开当前目录 




+ [更新插件](http://blog.csdn.net/cnsword/article/details/42918215)

- - - -

+ 感谢 @linsongze 的测试反馈
+ 2016-08-01 更新
