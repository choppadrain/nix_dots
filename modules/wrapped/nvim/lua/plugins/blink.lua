require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
    keymap = { preset = 'default' },
    appearance = {         nerd_font_variant = 'mono'
    },
    signature = { enabled = true },
    
    completion = {
        documentation = { auto_show = true },
        menu = {
            auto_show = true,
            draw = {
                treesitter = { "lsp" },
                columns = { 
                    { "kind_icon", "label", "label_description", gap = 1 }, 
                    { "kind" } 
                },
            },
        },
    }, 


    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    
    fuzzy = { implementation = "prefer_rust" },
})
