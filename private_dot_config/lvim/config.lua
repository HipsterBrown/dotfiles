--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "nord"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-h>"] = "<cmd>lua require('Navigator').left()<CR>"
lvim.keys.normal_mode["<A-k>"] = "<cmd>lua require('Navigator').up()<CR>"
lvim.keys.normal_mode["<A-l>"] = "<cmd>lua require('Navigator').right()<CR>"
lvim.keys.normal_mode["<A-j>"] = "<cmd>lua require('Navigator').down()<CR>"
lvim.keys.normal_mode["<A-p>"] = "<cmd>lua require('Navigator').prevous()<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.insert_mode["jk"] = "<Esc>"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.builtin.which_key.mappings['z'] = { "<cmd>ZenMode<cr>", "Zen mode" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects display_type=full<CR>", "Projects" }
lvim.builtin.which_key.mappings['g']['y'] = { "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>",
  "Copy current git to clipboard" }
lvim.builtin.which_key.mappings['g']['P'] = { "<cmd>Telescope gh pull_request<cr>", "Copy current git to clipboard" }
lvim.builtin.which_key.mappings["w"] = {
  name = "+Window/Splits",
  n = { ":new<CR>", "Open a new window" },
  c = { ":close<CR>", "Close current window" },
  o = { ":only<CR>", "Close all other windows" },
  h = { "<C-w>h", "Focus window left" },
  j = { "<C-w>j", "Focus window down" },
  k = { "<C-w>k", "Focus window up" },
  l = { "<C-w>l", "Focus window right" },
  m = { ":wincmd _<cr>:wincmd \\|<cr>", "Maximize window" }
}
lvim.builtin.which_key.mappings["w"]["-"] = { ":split<CR>", "Split horizontal" }
lvim.builtin.which_key.mappings["w"]["/"] = { ":vsplit<CR>", "Split vertical" }
lvim.builtin.which_key.mappings["w"]["]"] = { ":resize +5<CR>", "Enlarge window" }
lvim.builtin.which_key.mappings["w"]["["] = { ":resize -5<CR>", "Shrink window" }
lvim.builtin.which_key.mappings["w"]["="] = { ":wincmd =<CR>", "Reset window evenly" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
lvim.builtin.which_key.mappings["<tab>"] = { "<cmd>BufferPrevious<cr>", "Last buffer" }
lvim.builtin.which_key.mappings["'"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Show floating terminal" },
  h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Open horizontal terminal" },
  v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Open vertical terminal" }
}
lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope find_files<cr>", "Search in project" }
lvim.builtin.which_key.mappings["b"]["d"] = { "<cmd>BufferClose!<cr>", "Close buffer" }
lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>BufferNext<cr>", "Next buffer" }
lvim.builtin.which_key.mappings["b"]["p"] = { "<cmd>BufferPrevious<cr>", "Previous buffer" }
lvim.builtin.which_key.mappings["b"]["s"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in current buffer" }
lvim.builtin.which_key.mappings["f"] = {
  name = "+File",
  f = { "<cmd>Telescope file_browser<cr>", "Open file/folder" },
  s = { "<cmd>w!<cr>", "Save file" },
  S = { "<cmd>wa!<cr>", "Save all files" },
  t = { "<cmd>NvimTreeToggle<cr>", "Toggle file tree" },
  T = { "<cmd>NvimTreeFindFile<cr>", "Show active file in file tree" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open recent" }
}
lvim.builtin.which_key.mappings["l"]["t"] = {
  name = "+TS Utils",
  o = { "<cmd>TSLspOrganize<cr>", "Organize imports" },
  r = { "<cmd>TSLspRenameFile<cr>", "Rename file" },
  i = { "<cmd>TSLspImportAll<cr>", "Import all missing imports" }
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}
lvim.builtin.telescope.extensions.project = {
  base_dirs = {
    '~/src',
    { '~/src/retail',                  max_depth = 2 },
    { '~/src/for_business',            max_depth = 2 },
    { '~/src/style-closet',            max_depth = 2 },
    { '~/src/trade-execution-tooling', max_depth = 2 }
  },
  hidden_files = true,
  sync_with_nvim_tree = true
}
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "gh")
end

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "toml",
  "json",
  "tsx",
  "http",
  "html",
  "svelte",
  "scss",
  "ruby",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\<C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\<C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\<C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\<C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\<C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\<C-n><C-W>l]], opts)
end

lvim.autocommands = {
  {
    "TermOpen",
    {
      pattern = { "floaterm" },
      command = "lua set_terminal_keymaps()"
    }
  }
}
-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
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

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

lvim.plugins = {
  { "LunarVim/colorschemes" },
  { "shaunsingh/nord.nvim" },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "tpope/vim-bundler",
    cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" }
  },
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   event = "BufWinEnter",
  --   init = function()
  --     vim.cmd [[packadd telescope.nvim]]
  --   end,
  -- },
  {
    "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Sview",
      "Scontroller",
      "Smodel",
      "Vview",
      "Vcontroller",
      "Vmodel",
      "Tview",
      "Tcontroller",
      "Tmodel",
      "Rails",
      "Generate",
      "Runner",
      "Extract"
    },
    {
      "ruifm/gitlinker.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("gitlinker").setup()
      end
    },
    {
      "numToStr/Navigator.nvim",
      config = function()
        require('Navigator').setup()
      end
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "nvim-telescope/telescope-github.nvim",
      config = function()
        require('telescope').load_extension('gh')
      end
    },
    {
      "p00f/nvim-ts-rainbow"
    },
    {
      "nvim-treesitter/playground",
      event = "BufRead"
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
    },
    {
      "npxbr/glow.nvim",
      ft = { "markdown" }
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup()
      end
    },
    {
      "jose-elias-alvarez/nvim-lsp-ts-utils"
    },
    {
      "rmagatti/auto-session",
      config = function()
        require('auto-session').setup({
          log_level = 'info',
          auto_session_suppress_dirs = { '~/' }
        })
      end
    },
    {
      "folke/twilight.nvim",
      config = function()
        require('twilight').setup()
      end
    },
    {
      "folke/zen-mode.nvim",
      dependencies = { 'folke/twilight.nvim' },
      config = function()
        require('zen-mode').setup()
      end
    },
    {
      "watzon/vim-edge-template"
    },
    {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup({
          mapping = { "jk", "jj" },
          clear_empty_lines = true,
        })
      end,
    }
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
