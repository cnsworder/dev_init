# config.set()
# config.bind()
# config.source()


config.load_autoconfig()

c.editor.command = ["neovide", "-f", "{file}", "-c", "normal {line}G{column0}l"]

c.fonts.web.size.default = 20
c.fonts.default_size = '14pt'

c.tab.show = "never"
c.tab.position = "left"

c.content.fullscreen.window = True


# config.set("content.javascript.enabled", True)
c.content.javascript.enabled = True

c.content.blocking.enabled = True


c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.google.com/search?q={}',
    'bg': "https://cn.bing.com/search?q={}",
    'ddg': 'https://duckduckgo.com/?q={}'
}

config.bind('cs', 'config-source')
config.bind('<Ctrl+/>', 'hint links spawn --detach mpv {hint-url}')
config.bind('<Ctrl-o>', 'mode-enter passthrough')
#config.source("keymaps.py")
