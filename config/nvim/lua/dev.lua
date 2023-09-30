local ft = require('guard.filetype')
ft('c'):fmt('clang-format')
       :lint('clang-tidy')
ft('lua'):fmt('lsp')
        :append('stylua')
        :lint('selene')
ft('typescript,javascript,typescriptreact'):fmt('prettier')
ft('python'):fmt('yapf')
            :lint('flake8')


