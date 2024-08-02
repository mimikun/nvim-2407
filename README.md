# nvim-2407

2024年7月 ver5相当

## Setup

```fish
set -Ux NVIM_APPNAME nvim-2407
```

## Note

denopsなど主流ではない技術のプラグインは使わない

テスト段階ではtreesitterのパーサはLuaだけいれる

同様にlspサーバもLuaだけ

理由: 人権がないと時間がかかるため

## TODO

- [ ] https://github.com/mfussenegger/nvim-lint
- [ ] https://github.com/stevearc/conform.nvim
- [ ] dial-nvim.lua
- [ ] markview-nvim.lua
- [ ] nvim-bqf.lua
- [ ] render-markdown.lua
- [ ] barbecue-nvim.lua

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

- [ ] https://github.com/MeanderingProgrammer/markdown.nvim
- [ ] https://github.com/OXY2DEV/markview.nvim

