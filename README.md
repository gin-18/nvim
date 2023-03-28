# neovim 配置

<img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-alpha.png?raw=true" alt="nvim-start" />

## 1. 依赖

使用配置之前确保安装了以下软件包。

```
1. nodejs
2. npm
3. yarn
4. python3
5. pip
6. nerd-fonts
7. fzf
8. xclip
9. ripgrep
10. wget
11. unzip
```

### Arch Linux 使用 pacman 和 yay 安装依赖

```sh
sudo pacman -S nodejs npm yarn python3 python-pip fzf ripgrep xclip

yay -S nerd-fonts-fira-code
```

### npm 安装 neovim

```sh
sudo npm install -g neovim
```

### pip 安装 pynvim

```sh
pip3 install --user pynvim

pip install --user pynvim
```

## 2. 使用本配置

```sh
git clone https://github.com/GIN-18/nvim.git ~/.config/nvim
```

## 3. 快捷键

| 快捷键            | 描述                           |
|-------------------|--------------------------------|
| `s`               | 保存                           |
| `shift` `s`       | 保存退出                       |
| `shift` `h`       | 光标移动到行首                 |
| `shift` `l`       | 光标移动到行尾                 |
| `shift` `j`       | 光标向下移动5行                |
| `shift` `k`       | 光标向上移动5行                |
| `space` `s` `l`   | 左右分屏，光标在左分屏         |
| `space` `s` `j`   | 上下分屏，光标在下分屏         |
| `shift` `alt` `h` | 光标移动到左分屏               |
| `shift` `alt` `j` | 光标移动到下分屏               |
| `shift` `alt` `k` | 光标移动到上分屏               |
| `shift` `alt` `l` | 光标移动到右分屏               |
| `shift` `up`      | 上下分屏时，增加分屏高度       |
| `shift` `down`    | 上下分屏时，减少分屏高度       |
| `shift` `left`    | 左右分屏时，增加分屏宽度       |
| `shift` `right`   | 左右分屏时，减少分屏宽度       |
| `space` `y` `c`   | 在可视模式下，复制到系统剪贴板 |
| `space` `n` `h`   | 取消搜索结果的高亮             |
| `space` `e` `v`   | 打开 `$MYVIMRC`                |

在 `lua/core/keymaps.lua` 文件中可以修改快捷键的配置。

## 4. 基本功能

### :necktie: 插件管理器 - lazy.nvim

---

**插件管理器地址**：[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### :wrench: lsp 支持 - nvim-lspconfig

---

**插件地址**：[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

| 快捷键          | 描述                     |
|-----------------|--------------------------|
| `space` `g` `d` | 跳转到变量或者函数定义处 |
| `space` `g` `r` | 跳转到变量或者函数引用处 |
| `space` `r` `n` | 变量或者函数重命名       |
| `space` `c` `f` | 代码格式化               |
| `space` `c` `a` | 列出 `code action`       |
| `space` `d` `t` | 预览 `diagnostic`        |
| `space` `d` `n` | 下一处 `diagnostic`      |
| `space` `d` `p` | 上一处 `diagnostic`      |

在 `lua/plugins/nvim-lspconfig.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-lspconfig-diagnostic.png?raw=true" alt="nvim-lspconfig-diagnostic" />
</details>

### :computer: 自动补全 - nvim-cmp

---

**插件地址**：[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

| 快捷键             | 描述                         |
| ------------------ | ---------------------------- |
| `ctrl` `n`         | 向下高亮补全项               |
| `ctrl` `p`         | 向上高亮补全项               |
| `ctrl` `j`         | 代码片段跳到下一个标记处     |
| `ctrl` `k`         | 代码片段跳到上一个标记处     |
| `enter`            | 选择高亮的补全项             |

在 `lua/plugins/nvim-cmp.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <span>内容补全</span>
  <br />
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-cmp.png?raw=true" alt="nvim-cmp" />
  <br />
  <span>命令行补全</span>
  <br />
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-cmdline.png?raw=true" alt="nvim-cmdline" />
  <br />
  <span>[ "/", "?" ] 查找补全</span>
  <br />
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-search.png?raw=true" alt="nvim-search" />
</details>

### :books: 代码片段 - luasnip

---

**插件地址**：[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

在 `my-snippets/snippets` 目录下可以添加自定义的代码片段。

添加完成需要在 `my-snippets/package.json` 文件中引入自定义的代码片段。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <span>代码片段的写法和 <code>vscode</code> 的代码片段的写法一样。</span>
  <br />
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/luasnip.png?raw=true" alt="luasnip" />
</details>

### :telescope: 模糊搜索 - telescope

---

**插件地址**：[nvim-telescope/telescope.vim](https://github.com/nvim-telescope/telescope.nvim)

| 快捷键          | 描述                                    |
|-----------------|-----------------------------------------|
| `space` `f` `f` | 查找当前目录下的文件                    |
| `space` `f` `h` | 查找家目录下的文件                      |
| `space` `f` `g` | 查找 `git` 管理的文件                   |
| `space` `f` `o` | 查找最近打开过的文件                    |
| `space` `f` `b` | 查找 `Buffers`                          |
| `space` `f` `l` | 查找行                                  |
| `space` `f` `p` | 查找项目                                |
| `space` `f` `t` | 查找 `todo comments`                    |
| `ctrl` `n`      | 打开 `telescope` 后，向下移动一格       |
| `ctrl` `p`      | 打开 `telescope` 后，向上移动一格       |
| `ctrl` `j`      | 打开 `telescope` 后，下一条搜索过的内容 |
| `ctrl` `k`      | 打开 `telescope` 后，上一条搜索过的内容 |
| `enter`         | 打开 `telescope` 后，选择高亮的选项     |
| `esc`           | 退出 `telescope`                        |

在 `lua/plugins/telescope.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <span>查找项目，需要 <a href="https://github.com/ahmedkhalf/project.nvim">ahmedkhalf/project.nvim</a> 插件的支持。</span>
  <br />
  <span>在 <code>lua/plugins/project.lua</code> 文件中可以修改此插件的配置。</sapn>
  <br />
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/telescope-project.png?raw=true" alt="telescope-project" />
</details>

### :file_folder: 文件管理器 - nvim-tree

---

**插件地址**：[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

| 快捷键          | 描述             |
|-----------------|------------------|
| `space` `e` `e` | 打开 `nvim-tree` |
| `q`             | 退出 `nvim-tree` |

在 `lua/plugins/nvim-tree.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/nvim-tree.png?raw=true" alt="nvim-tree" />
</details>

## 5. git 支持

### :pushpin: 显示 git 标记 - gitsigns

---

**插件地址**：[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

| 快捷键          | 描述              |
|-----------------|-------------------|
| `space` `h` `r` | 重置 `hunk`       |
| `space` `h` `n` | 下一处 `hunk`     |
| `space` `h` `p` | 上一处 `hunk`     |
| `space` `h` `l` | 预览 `hunk`       |

在 `lua/plugins/gitsigns.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/gitsigns.png?raw=true" alt="gitsigns" />
</details>

### :koala: git 操作 - lazygit

---

**插件地址**：[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

| 快捷键          | 描述           |
|-----------------|----------------|
| `space` `g` `g` | 打开 `lazygit` |
| `q`             | 退出 `lazygit` |

在 `lua/plugins/lazygit.lua` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/lazygit.png?raw=true" alt="lazygit" />
</details>

## 6. Markdown 支持

### :pencil: 快速输入

---

在 `插入模式(insert-mode)` 下，`markdown` 文件中输入：

| 快捷键            | 描述           |
|-------------------|----------------|
| `h1`              | 输入一级标题   |
| `h2`              | 输入二级标题   |
| `h3`              | 输入三级标题   |
| `h4`              | 输入四级标题   |
| `h5`              | 输入五级标题   |
| `h6`              | 输入六级标题   |
| `img`             | 插入图片       |
| `codeblock`       | 插入代码块     |
| `code`            | 使用反引号包裹 |
| `table`           | 插入表格       |
| `link`            | 插入链接       |
| `horizontal rule` | 插入分隔线     |
| `bold`            | 输入粗体文本   |
| `italic`          | 输入斜体文本   |
| `bold and italic` | 输入粗斜体文本 |
| `strikethrough`   | 输入删除线     |

在 `my-snippets/snippets/markdown.json` 文件中可以修改配置。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/md-quick-input.gif?raw=true" alt="md-quick-input" />
</details>

### :eyes: Markdown 预览 - markdown-preview

---

**插件地址**：[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

| 快捷键      | 描述       |
| ----------- | ---------- |
| `shift` `r` | 打开预览   |

配置中使用 `microsoft-edge-beta` 浏览器作为预览工具。

在 `init.vim` 文件中可以找到关于 `markdown-preview` 的配置并修改。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/markdown-preview.gif?raw=true" alt="markdown-preview" />
</details>

### :straight_ruler: 表格模板 - vim-table-mode

---

**插件地址**：[dhruvasagar/vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

| 快捷键            | 描述             |
|-------------------|------------------|
| `alt` `shift` `t` | 启动表格模板     |
| `alt` `shift` `r` | 表格模板重新对齐 |

在 `init.vim` 文件中可以找到关于 `table-mode` 的配置并修改。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/table-mode.gif?raw=true" alt="table-mode" />
</details>

### :clipboard: 从剪贴板插入图片 - md-img-paste

---

**插件地址**：[ferrine/md-img-paste.vim](https://github.com/ferrine/md-img-paste.vim)

| 快捷键          | 描述           |
|-----------------|----------------|
| `space` `p` `i` | 输入图片的名称 |

在 `init.vim` 文件中可以找到关于 `md-img-paste` 的配置并修改。

<details>
  <summary><strong>Demo (click to expand)</strong></summary>
  <img src="https://github.com/GIN-18/pictures/blob/master/readme-images/nvim/md-img-paste.gif?raw=true" alt="md-img-paste" />
</details>
