# nvim-2407

2024年7月 ver5相当

## Setup

```fish
set -Ux NVIM_APPNAME nvim-2407
```

## Note

- denopsなど外部依存を必要とするプラグインは使わない
    - 理由: 人権がないとまともに動かない
- テスト段階ではtreesitterやmasonのものは最低限だけいれる
    - 理由: 人権がないとインストールに時間かかる
- プラグインファイルの名前の付け方
    - [rocks-config.nvim の Note にあるやり方](https://github.com/nvim-neorocks/rocks-config.nvim?tab=readme-ov-file#options) に従う

## インストール時間

全部入りの本番構成で試す

### Home-Win

- 1m56s

## 起動時間

### Home-Win

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 157.044900 msec
Total Max:     167.195000 msec
Total Min:     149.317000 msec
```

## TODO

- [ ] `:q` で閉じたあと中身が見えたままになる
- [ ] mimikun-icons.lua
    - [ ] alpha-nvim.lua
    - [ ] crates-nvim.lua
    - [ ] diffview-nvim.lua
    - [ ] eskk-vim.lua
    - [ ] fidget.lua
    - [ ] gitgraph-nvim.lua
    - [ ] gitsigns-nvim.lua
    - [ ] indent-blankline.lua
    - [ ] lazygit-nvim.lua
    - [ ] legendary-nvim.lua
    - [ ] lspsaga-nvim.lua
    - [ ] lualine-nvim.lua
    - [ ] mason-nvim.lua
    - [ ] neogit.lua
    - [ ] nvim-cmp.lua
    - [ ] nvim-navic.lua
    - [ ] nvim-tree.lua
    - [ ] obsidian-nvim-opts.lua
    - [ ] package-info-nvim.lua
    - [ ] render-markdown.lua
    - [ ] satellite-nvim.lua
    - [ ] sidebar-nvim.lua
    - [ ] smoothcursor-nvim.lua
    - [ ] todo-comments-nvim.lua
    - [ ] trouble.lua
    - [ ] which-key-nvim.lua
- [ ] 欲しいの全部いれる(本番前の確認)
    - [ ] nvim-cmp.lua
    - [ ] nvim-lspconfig.lua
    - [ ] mason-nvim.lua
    - [ ] nvim-treesitter.lua
