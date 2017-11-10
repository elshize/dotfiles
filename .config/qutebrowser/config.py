PADDING = {
    'top': 2,
    'bottom': 2,
    'left': 4,
    'right': 4
}
c.auto_save.session = True
c.downloads.position = 'bottom'
c.spellcheck.languages = ['en-US', 'pl-PL']
#c.content.headers.user_agent = 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0'
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.63 Safari/537.36'
c.tabs.last_close = 'default-page'
c.tabs.mousewheel_switching = False
c.tabs.title.format = '{index}: {title}'
c.tabs.padding = PADDING
c.statusbar.padding = PADDING
c.completion.scrollbar.padding = 4
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        # 'DEFAULT': 'https://www.ecosia.org/search?q={}',
        'g': 'https://www.google.com/search?hl=en&q={}',
        's': 'https://scholar.google.com/scholar?hl=en&q={}'
}

# Colors
c.colors.completion.odd.bg = '#002b36'
c.colors.completion.even.bg = '#003b4a'
c.colors.completion.category.bg = '#175782'
c.colors.completion.category.border.top = '#175782'
c.colors.completion.category.border.bottom = '#fff'
c.colors.completion.item.selected.bg = '#b58900'
c.colors.statusbar.normal.bg = '#002b36'
c.colors.statusbar.command.bg = '#002b36'
c.colors.tabs.selected.odd.bg = '#002b36'
c.colors.tabs.selected.even.bg = '#002b36'
#c.colors.tabs.odd.bg = '#002b36'
#c.colors.tabs.even.bg = '#004759'
#c.colors.tabs.selected.odd.bg = '#175782'
#c.colors.tabs.selected.even.bg = '#175782'
c.colors.tabs.bar.bg = '#002b36'

# Fonts
regular = '11pt Fira Sans'
monospace = '11pt monospace'
c.fonts.monospace = 'Inconsolata, Terminus, Monospace, "DejaVu Sans Mono"'
c.fonts.tabs = 'bold 12pt monospace'
c.fonts.completion.entry = '11pt monospace'
c.fonts.completion.category = 'bold 11pt monospace'
c.fonts.statusbar = 'bold 11pt monospace'
c.fonts.downloads = 'bold 11pt monospace'
c.fonts.prompts = 'bold 11pt monospace'
c.fonts.hints = 'bold 14px monospace'
c.fonts.debug_console = '11pt monospace'
c.fonts.web.family.standard = 'Fira Sans'
c.fonts.keyhint = '11pt monospace'
c.fonts.messages.error = 'bold 11pt monospace'
c.fonts.messages.warning = 'bold 11pt monospace'
c.fonts.messages.info = 'bold 11pt monospace'

# Bindings
for tabnum in range(10):
    config.bind('<Ctrl-{}>'.format(tabnum),
                'tab-focus {}'.format(tabnum))
