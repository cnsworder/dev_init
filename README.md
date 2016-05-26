# 顺手的emacs

这是自己使用的emacs环境，经常用来写 `c/c++` `python` 偶尔写点`HTML`和`javascript`。

## 特性描述

1. 使用`swiper/ivy`替换了`helm`
2. 使用`which-key`来做快捷键提示
3. 使用`company`做补全的前端
4. 使用`ycmd`做为代码补全的后端
5. 使用`dracula`做为主题
6. 使用`magit`作为git前端

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
