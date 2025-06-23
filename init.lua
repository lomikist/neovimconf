require "options"
require "mappings"
require "commands"

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require "plugins"

-- vim.cmd "colorscheme monokai"
-- vim.cmd "colorscheme monokai-nightasty"
-- vim.cmd "colorscheme kanagawa"
-- Default options:
-- Automatically start Obsession if a session doesn't exist
--
require('bamboo').setup {
	style = 'vulgaris',
	transparent = false,
	highlights = {
    NormalFloat = { bg = "#3b3f58", fg = "#e0e6ff" },        -- lighter dark blue-gray bg with bright text
    FloatBorder = { bg = "#3b3f58", fg = "#a0b8ff" },        -- soft blue border
    DiagnosticError = { fg = "#ff8f9e", bg = "#3b3f58" },    -- pastel red
    DiagnosticWarn  = { fg = "#f5d07f", bg = "#3b3f58" },    -- pastel yellow
    DiagnosticInfo  = { fg = "#8fc9ff", bg = "#3b3f58" },    -- pastel blue
    DiagnosticHint  = { fg = "#b5d48f", bg = "#3b3f58" },    -- pastel green
	GitSignsAddPreview    = { fg = "#00aa00", bg = "#3b3f58" },   -- darker green
	GitSignsDeletePreview = { fg = "#cc4444", bg = "#3b3f58" },   -- darker red
	GitSignsChangePreview = { fg = "#ffaa00", bg = "#3b3f58" },   -- optional: orange 
  }
}
vim.cmd "colorscheme bamboo-light"

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("Obsession")
        end
    end
})

-- Automatically stop Obsession when quitting Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if vim.fn.exists(':Obsess') == 2 then
            vim.cmd("Obsess!")
        end
    end
})

