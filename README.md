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

## TODO

- [ ] nvim-cmp.lua
- [ ] nvim-lspconfig.lua
- [ ] mason-nvim.lua
- [ ] nvim-treesitter.lua
- [ ] barbar-nvim.lua
