# My Custom Neovim Config

<td width="30%" align="center">
      <img src="https://raw.githubusercontent.com/IbrokhimN/neovim-config/refs/heads/main/config_photo.png" alt="IJAI Logo"/>
</td>

> Beautiful, fast and functional Neovim setup powered by [lazy.nvim](https://github.com/folke/lazy.nvim)

This configuration turns Neovim into a modern IDE with autocompletion, file explorer, status line, fuzzy finder, dashboard, and a cute little **todo manager** 🩷  

---

## ✨ Features

- 🎨 **Theme:** [`doom-one`](https://github.com/NTBBloodbath/doom-one.nvim)
- 🧠 **Autocompletion:** `nvim-cmp` + `LuaSnip`
- 🌳 **Syntax Highlighting:** `nvim-treesitter`
- 📂 **File Explorer:** `nvim-tree`
- 🔍 **Fuzzy Finder:** `telescope.nvim`
- 🧭 **Keybindings Help:** `which-key.nvim`
- 🖥️ **Status Line:** `lualine.nvim`
- 🏠 **Dashboard:** `dashboard-nvim` (Doom-style)
- ✅ **Todo List Widget** built-in at the bottom panel

---

## 🧩 Plugins Overview

| Plugin | Purpose |
|--------|----------|
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [NTBBloodbath/doom-one.nvim](https://github.com/NTBBloodbath/doom-one.nvim) | Dark modern theme |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet support |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | File finder & grep |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding helper |
| [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Startup dashboard |

---

## ⚙️ Installation

1. Clone this repo or copy `init.lua` to your Neovim config directory:
   ```bash
   mkdir -p ~/.config/nvim
   cd ~/.config/nvim
   nano init.lua
````

Paste the contents of your config.

2. Start Neovim:

   ```bash
   nvim
   ```

3. Lazy.nvim will automatically install itself and the listed plugins.
   Wait for the setup to complete, then restart Neovim.

---

## Keybindings

### Dashboard

When Neovim starts, you'll see a **Doom-style dashboard** with these shortcuts:

| Key | Action                   |
| --- | ------------------------ |
| `f` | Find File                |
| `r` | Recent Files             |
| `g` | Live Grep                |
| `l` | Open Lazy Plugin Manager |
| `c` | Edit Config (`$MYVIMRC`) |
| `u` | Update Plugins           |
| `h` | Check Health             |
| `q` | Quit Neovim              |

---

## File Tree Commands

| Command | Description    |
| ------- | -------------- |
| `:NTO`  | Open NvimTree  |
| `:NTC`  | Close NvimTree |

---

## Todo List Panel

A cozy little bottom panel for managing simple todos.

### Open Todo Panel

```vim
:Todo
```

### Controls

| Key       | Action                   |
| --------- | ------------------------ |
| `<Enter>` | Toggle checkmark (✔ / ✗) |
| `q`       | Close panel              |

Tasks are saved automatically to:

```
~/.local/share/nvim/todo.txt
```

Example file:

```
❯ Learn Lua basics ✗
❯ Setup Neovim plugins ✔
❯ Drink some water ✗
```

---

## Autocompletion

* Press `<C-Space>` to trigger completion manually.
* Use `<Tab>` / `<S-Tab>` to navigate.
* Press `<CR>` (Enter) to confirm.
* Snippet support via `LuaSnip`.

---

## UI Tweaks

* `termguicolors` enabled for true color
* Relative & absolute line numbers
* `doom-one` colorscheme applied on startup
* `lualine` with TokyoNight theme

---

## Notes

* All plugins are managed by `lazy.nvim`, located in:

  ```
  ~/.local/share/nvim/lazy
  ```
* If you add or remove plugins, run:

  ```vim
  :Lazy sync
  ```
* To update everything:

  ```vim
  :Lazy update
  ```
