local ft = require('guard.filetype')
ft('typescript,javascript,typescriptreact'):fmt('prettier')
ft('lua'):fmt('lsp')
        :append('stylua')
ft('c'):fmt('clang-format')
--[[
ft('python'):fmt('yapf')
            :lint('flake8')
]]--


