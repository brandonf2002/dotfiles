local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
})


-- lsp.skip_server_setup({'clangd'})

-- lsp.configure('ltex', {
--     settings = {
--         ltex = {
--             language = "en-GB",
--         },
--     },
--     filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" }
-- })

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


lsp.set_sign_icons({
    error = ' ',
    warn = ' ',
    hint = '󰌶 ',
    info = ' '
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.configure('clangd', {
    settings = {
        server = {
            cmd = {
                'clangd',
                '--background-index',
                '--clang-tidy',
                '--completion-style=bundled',
                '--header-insertion=iwyu',
                '--suggest-missing-includes',
                '--pch-storage=memory',
                '--cross-file-rename',
                '--query-driver=/home/brandon/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/*'
            }
        },
        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--completion-style=bundled',
            '--header-insertion=iwyu',
            '--suggest-missing-includes',
            '--pch-storage=memory',
            '--cross-file-rename',
            '--query-driver=/home/brandon/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/*'
        }
    }
})

require('clangd_extensions').setup({
    server = {
        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--completion-style=bundled',
            '--header-insertion=iwyu',
            '--suggest-missing-includes',
            '--pch-storage=memory',
            '--cross-file-rename',
            '--query-driver=/home/brandon/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/*'
        }
    }
})


lsp.setup()

local cmp = require('cmp')

vim.diagnostic.config({
    virtual_text = true
})

local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

vim.cmd('packadd copilot')
require('copilot').setup({
    suggestion = {enabled = false},
    panel = {enabled = false},
})

require('copilot_cmp').setup()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
        {name = 'copilot'},
        -- {name = 'cmp_tabnine'},
    },
    mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-n>'] = cmp_action.tab_complete(),
        ['<C-p>'] = cmp_action.select_prev_or_fallback(),
        ['<CR>'] = cmp.mapping.confirm({
            -- documentation says this is important.
            -- I don't know why.
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        })
    },

    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})
