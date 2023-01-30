require("luasnip.loaders.from_vscode").lazy_load()
-- load snippets from my-snippets
require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } })
