配置文件
=========

配置方法
--------    

```
    git clone git@github.com:cnsworder/dev_init  
    cd dev_init
    ./init.sh -a
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
+ `F3` 文件浏览
+ `F2` 刷新文件
+ `F4` Tagbar
+ `F5` UndoTree
+ `F10` 更新插件
+ `n` 显示行号
+ `l` 显示不可见字符
+ `<leader>f` FufBuffer

emacs使用说明
-----------------

+ `F2` 刷新文件
+ `F3` 文件浏览
+ `F4` `eshell`
+ `F6` 显示行号
+ `Ｍ-x` `helm-M-x`
+ `C-x C-b` `helm-buffer-list`
+ `C-c C-c` 智能补全
+ `TAB` 片段补全
+ `M-TAB` `heml`补全
