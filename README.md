配置文件
=========

配置方法
--------    

```
    git clone git@github.com:cnsworder/crossword  
    cd crossword
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
  + emacs第一次运行后可以把　`cn-set-package` 注释掉，就不会每次启动都检查是否安装了相应的包了
  
  + 配置说明:[cnsworder Blog] [1]   
  
mail:[cnsworder@gmail.com](mailto:cnsowrder@gmail.com)

[1]: http://blog.csdn.net/cnsword  "Blog"
