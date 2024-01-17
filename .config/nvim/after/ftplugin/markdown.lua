-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_gb' }

-- require('cmp').setup({
--     sources = {
--         {
--             name = 'spell',
--             option = {
--                 keep_all_entries = false,
--                 enable_in_context = function()
--                     return true
--                 end,
--             },
--         },
--     },
-- })

require("cmp").setup({
  -- other settings
  sources = {
  -- other sources
    {
      name = "dictionary",
      keyword_length = 2,
    },
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    {name = 'copilot'},
    -- {name = 'cmp_tabnine'},
  }
})

local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = true,
  document = false,
  document_command = "wn %s -over",
  async = false,
  sqlite = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

dict.switcher({
  spelllang = {
    en = "/home/brandon/.local/share/nvim/dict/my.dict",
  },
})

-- local function toggle_todo()
--   local line = vim.api.nvim_get_current_line()

--   -- Check if the line contains a Markdown checkbox
--   if string.find(line, "%- %[%s%]") then
--     -- Replace "[ ]" with "[x]"
--     local new_line = string.gsub(line, "%[%s%]", "[x]")
--     vim.api.nvim_set_current_line(new_line)
--   elseif string.find(line, "%- %[x%]") then
--     -- Replace "[x]" or "[X]" with "[ ]"
--     local new_line = string.gsub(line, "%[x%]", "[ ]")
--     vim.api.nvim_set_current_line(new_line)
--   end
-- end

-- vim.keymap.set('n', '<C-c>', function ()
--   toggle_todo()
-- end, { noremap = false, silent = true })

vim.cmd(':set conceallevel=0')
