--[[l
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
--vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  --  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { name = "phpcsfixer",

<<<<<<< HEAD
  --     --    extra_args = { "--allow-risky=yes" },
  --     filetypes = { "php" },
  -- },
  {
    command = "prettier_eslint",
    filetypes = { "javascript", "vue" },
  },
=======
    --     --    extra_args = { "--allow-risky=yes" },
    --     filetypes = { "php" },
    -- },
    -- {
    --     command = "prettier_eslint",
    --     filetypes = { "vue" },
    -- },
>>>>>>> 2e9a022e419fa6a8e9d3167b5589208ab959ee3e
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "javascript", "vue" }
  }
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
--lvim.plugins = {
--  {
--    "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
--}
lvim.plugins = {
<<<<<<< HEAD
  { "lunarvim/colorschemes" },
  { "gpanders/editorconfig.nvim" },
  { "lervag/vimtex" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  -- automatically install all the formatters and linters specified by the following
  -- config options:
  -- * linters.setup
  -- * formatters.setup
  { "jayp0521/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        automatic_installation = false,
        automatic_setup = true,
        ensure_installed = nil,
      })
      require("mason-null-ls").setup_handlers()
    end,
  }
=======
    { "lunarvim/colorschemes" },
    { "gpanders/editorconfig.nvim" },
    { "lervag/vimtex" },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },
    -- automatically install all the formatters and linters specified by the following
    -- config options:
    -- * linters.setup
    -- * formatters.setup
    { "jayp0521/mason-null-ls.nvim",
        config = function()
            require("mason-null-ls").setup({
                automatic_installation = false,
                automatic_setup = true,
                ensure_installed = nil,
            })
            require("mason-null-ls").setup_handlers()
        end,
    }
>>>>>>> 2e9a022e419fa6a8e9d3167b5589208ab959ee3e
}

require("lvim.lsp.manager").setup("phpactor")

local dap = require('dap')

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}"
    },
  }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
-- prettier-eslint
-- https://betterprogramming.pub/auto-formatting-javascript-source-code-on-neovim-with-prettier-and-elint-4795457c71e8
-- ATTENTION: Install command pretter-eslint locally first:
-- npm add --location=global prettier-eslint-cli
<<<<<<< HEAD
-- optioral: set your prefered indent with size
-- if pretter_eslint is missing in the local null-ls-plugin download it manually from
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting/prettier_eslint.lua
-- or find a way to update the null-ls-plugin
=======
-- optional: set your prefered indent with size
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- load required null-ls references
local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")
local FORMATTING = methods.internal.FORMATTING

-- Define the new javascript formatter
local pe = h.make_builtin({
    name = "prettier_eslint",
    meta = {
        url = "https://github.com/prettier/prettier-eslint-cli",
        description = "Eslint + Prettier",
    },
    method = FORMATTING,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "jsx"
    },
    factory = h.formatter_factory,
    generator_opts = {
        command = "prettier-eslint",
        args = { "--stdin", "--parser", "babel", "--resolve-plugins-relative-to", "~/.nvm/versions/node/v16.16.0/lib" },
        to_stdin = true,
    },
})

-- optional: Define a second formatter for JSON
local pejson = h.make_builtin({
    name = "prettier_eslint_json",
    meta = {
        url = "https://github.com/prettier/prettier-eslint-cli",
        description = "Eslint + Prettier",
    },
    method = FORMATTING,
    filetypes = {
        "json",
        "cjson",
    },
    factory = h.formatter_factory,
    generator_opts = {
        command = "prettier-eslint",
        args = { "--stdin", "--parser", "json" },
        to_stdin = true,
    },
})

-- Enable the the defined formatters
-- if you are using vanilla NeoVim + null-ls please
-- read how to install/enable on
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
local nls = require("null-ls")
nls.setup {
    on_attach = require("lvim.lsp").common_on_attach,
    sources = {
        pe,
        pejson
    }
}

-- optional: LunarVim related step. Here we enable eslint as linter for Javascript.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "eslint",
        filetypes = { "javascript" }
    }
}
>>>>>>> 2e9a022e419fa6a8e9d3167b5589208ab959ee3e
