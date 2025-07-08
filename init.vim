"   @Author: gin

lua << EOF
require('core.disabled')
require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.lazy')

require('config.lsp')
require('config.diagnostic')
EOF
