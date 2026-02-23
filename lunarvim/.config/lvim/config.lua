-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- komt van remap.lua ###########################
-- File explorer
lvim.keys.normal_mode["<leader>pv"] = ":Ex<CR>"
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted text around
lvim.keys.normal_mode["J"] = ":m '>+1<CR>gv=gv"
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
lvim.keys.normal_mode["K"] = ":m '<-2<cr>gv=gv"
-- vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Quality of life
lvim.keys.normal_mode["J"] = "mzJ`z"
-- vim.keymap.set("n", "J", "mzJ`z")
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
lvim.keys.normal_mode["n"] = "nzzzv"
-- vim.keymap.set("n", "n", "nzzzv")
lvim.keys.normal_mode["N"] = "Nzzzv"
-- vim.keymap.set("n", "N", "Nzzzv")

-- Keep buffer after pasting over another text
lvim.keys.visual_mode["<leader>p"] = [["_dP]]
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
lvim.keys.normal_mode["<leader>y"] = [["+y]]
lvim.keys.visual_mode["<leader>y"] = [["+y]]
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
lvim.keys.normal_mode["<leader>Y"] = [["+Y]]
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Deze heb ik nooit gebruikt denk ik. Is overgenomen van ThePrimegen
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- einde remap.lua ##############################


-- gedeeltelijk van set.lua #####################
vim.opt.guicursor = ""
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
-- einde set.lua ################################

-- Install plugins ##############################
lvim.plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "kiyoon/jupynium.nvim",
        -- build = "pip3 install --user .",
        build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
        -- build = "conda run --no-capture-output -n jupynium pip install .",
    },
    { "mbbill/undotree", name = "undotree" },
}


-- Theming ######################################
lvim.transparent_window = true
lvim.colorscheme = "catppuccin"

-- jupynium setup ###############################
local cmp = require "cmp"
local compare = cmp.config.compare

cmp.setup {
    sources = {
        { name = "jupynium", priority = 1000 },  -- consider higher priority than LSP
        { name = "nvim_lsp", priority = 100 },
    },
    sorting = {
        priority_weight = 1.0,
        comparators = {
            compare.score,            -- Jupyter kernel completion shows prior to LSP
            compare.recently_used,
            compare.locality,
        },
    },
}

-- Undotree setup ###############################
lvim.keys.normal_mode["<leader>u"] = vim.cmd.UndotreeToggle
-- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
