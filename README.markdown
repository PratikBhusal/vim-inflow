vim-inflow: vim plugin wrapper for [stephen-huan/inflow]
================================================================================

Table of Contents
--------------------------------------------------------------------------------
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Options](#options)

Requirements
--------------------------------------------------------------------------------
- `set formatprg=inflow` working standalone

Installation
--------------------------------------------------------------------------------
**Step 1: Ensure all [requirements](#requirements) are met**

**Step 2: Install the plugin with your preferred plugin manager**

| Plugin Manager | Install with... |
| -------------- | --------------- |
| [Minpac]       | `call minpac#add('PratikBhusal/vim-inflow')` |
| [Pathogen]     | `git clone https://github.com/PratikBhusal/vim-inflow ~/.vim/bundle/vim-inflow`|
| [Plug]         | `Plug 'PratikBhusal/vim-inflow'`             |
| Manual         | Put the files into your `~/.vim` directory |

Options
--------------------------------------------------------------------------------
### `g:inflow_on`
This option shows whether or not inflow is enabled.
If you wish to disable this plugin, do the following:

```viml
let g:inflow_on = 0
```

### `g:inflow_fallback_width`
When no textwidth is set (ie `&textwidth == 0`),
instead use this fallback value.

**Default:**
```viml
let g:inflow_fallback_width = 80
```

[Minpac]: https://github.com/k-takata/minpac
[Pathogen]: https://github.com/tpope/vim-pathogen
[Plug]: https://github.com/junegunn/vim-plug
[stephen-huan/inflow]: https://github.com/stephen-huan/inflow
