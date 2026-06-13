return {
    "nvim-lspconfig",
    lazy = false,
    after = function ()
     vim.lsp.config['lua_ls'] = {
       cmd = { 'lua-language-server' },
       filetypes = { 'lua' },
       root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
       settings = {
         Lua = {
           diagnostics = {
               globals = {'vim', 'require'},
           },
           runtime = {
             version = 'LuaJIT',
           }
         }
       }
     }
     vim.lsp.enable('lua_ls')
     vim.lsp.enable('nixd')
     vim.lsp.config("tinymist", {
         cmd = {'tinymist'},
         filetypes = {"typst"},
         root_markers = {".git", ".typst"},
         settings = {
             formatterMode = "typstyle",
         },
     })
     vim.lsp.enable("tinymist")
 end,
}
