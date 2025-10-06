local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

require("lazy").setup({
  { "folke/tokyonight.nvim", priority = 1000, config = function()
      vim.cmd("colorscheme tokyonight")
    end },
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      })
    })
  end
},



  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function()
      require("nvim-tree").setup({})
    end },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup { options = { theme = "tokyonight" } }
    end },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup { defaults = { file_ignore_patterns = {"node_modules"} } }
    end },
  { "folke/which-key.nvim", config = function()
      require("which-key").setup { }
    end },
{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup{
            theme = 'doom',
            config = {
                header = {
				[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
                },
                center = {
			    {
        icon = '󰱼  ',
        desc = 'Find File              ',
        key = 'f',
        action = 'Telescope find_files'
    },
    {
        icon = '󰈚  ',
        desc = 'Recent Files           ',
        key = 'r',
        action = 'Telescope oldfiles'
    },
    {
        icon = '󰙅  ',
        desc = 'Find Word              ',
        key = 'g',
        action = 'Telescope live_grep'
    },
    
    {
        icon = '󰒲  ',
        desc = 'Installed Plugins      ',
        key = 'l',
        action = 'Lazy'
    },
    {
        icon = '  ',
        desc = 'Edit Config            ',
        key = 'c',
        action = 'e $MYVIMRC'
    },
    {
        icon = '󰑓  ',
        desc = 'Update Plugins         ',
        key = 'u',
        action = 'Lazy update'
    },
    {
        icon = '󰍉  ',
        desc = 'Check Health           ',
        key = 'h',
        action = 'checkhealth'
    },
    {
        icon = '󰗼  ',
        desc = 'Quit                   ',
        key = 'q',
        action = 'qa'
    }	
		},
                footer = {"Snort! Snort! Snort!"}
            }
        }
    end,
    dependencies = {
        {'nvim-tree/nvim-web-devicons'},
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/plenary.nvim'}
    }
}
})



vim.api.nvim_create_user_command("NTO", function()
  vim.cmd("NvimTreeOpen")
end, {})

vim.api.nvim_create_user_command("NTC", function()
  vim.cmd("NvimTreeClose")
end, {})









