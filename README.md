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

- [ ] choice `カッコとじ系プラグイン`
- [ ] choice `markdown render`
- [ ] choice `null-ls replace`

### null-ls replace

- [ ] 組み合わせ
    - [ ] https://github.com/mfussenegger/nvim-lint
    - [ ] https://github.com/rshkarin/mason-nvim-lint
    - [ ] https://github.com/stevearc/conform.nvim
    - [ ] https://github.com/zapling/mason-conform.nvim
- [ ] 現状維持
    - [ ] https://github.com/nvimtools/none-ls.nvim
    - [ ] https://github.com/jay-babu/mason-null-ls.nvim
- [ ] de facto standard in Japan
    - [ ] https://github.com/mattn/efm-langserver
    - [ ] https://github.com/creativenull/efmls-configs-nvim

### カッコとじ系プラグイン

- [ ] https://github.com/windwp/nvim-autopairs
    - 現在使用中
- [ ] https://github.com/cohama/lexima.vim
    - VimScript製
    - ドットリピート対応
- [ ] https://github.com/hrsh7th/nvim-insx
    - Lua製
    - https://zenn.dev/hrsh7th/articles/dd7ea5a0e4a7b9

### markdown render

- [ ] https://github.com/MeanderingProgrammer/render-markdown.nvim
- [ ] https://github.com/OXY2DEV/markview.nvim
