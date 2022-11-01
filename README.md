# neovim 配置

<img src="https://github.com/GIN-18/readme-image/blob/master/nvim/nvim-start.png?raw=true" alt="nvim-start" />

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

`space` 键为 `空格键`。

| 快捷键            | 描述                           |
|-------------------|--------------------------------|
| `s`               | 保存                           |
| `shift` `s`       | 保存退出                       |
| `shift` `q`       | 不保存退出                     |
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

## 4. 基本功能

### 插件管理器 - vim-plug

---

**插件管理器地址**：[junegunn/vim-plug](https://github.com/junegunn/vim-plug)


### 自动补全 - nvim-cmp

---

**插件地址**：[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

| 快捷键             | 描述                         |
| ------------------ | ---------------------------- |
| `ctrl` `n`         | 向下高亮补全项               |
| `ctrl` `p`         | 向上高亮补全项               |
| `ctrl` `j`         | 跳到下一个标记处             |
| `ctrl` `k`         | 跳到上一个标记处             |
| `enter`            | 选择高亮的补全项             |

在 `lua/plugins/config/nvim-cmp.lua` 文件中可以修改配置。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="./images/coc.gif" alt="coc" />
</details>

### 模糊搜索 - telescope

---

**插件地址**：[nvim-telescope/telescope.vim](https://github.com/nvim-telescope/telescope.nvim)

| 快捷键          | 描述                                |
|-----------------|-------------------------------------|
| `space` `t` `f` | 查找当前目录下的文件                |
| `space` `t` `h` | 查找家目录下的文件                  |
| `space` `t` `b` | 查找 `Buffers`                      |
| `space` `t` `o` | 查找最近打开过的文件                |
| `space` `t` `l` | 查找行                              |
| `space` `t` `c` | 查找当前 `Buffer` 下的行            |
| `ctrl` `j`      | 打开 `telescope` 后，向下移动一格   |
| `ctrl` `k`      | 打开 `telescope` 后，向上移动一格   |
| `enter`         | 打开 `telescope` 后，选择高亮的选项 |
| `esc`           | 退出 `telescope`                    |

在 `plugin/telescope.vim` 文件中可以修改配置。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="./images/telescope.gif" alt="telescope" />
</details>

### 文件管理器 - rnvimr

---

**依赖**：[ranger/ranger](https://github.com/ranger/ranger)

**插件地址**：[kevinhwang91/rnvimr](https://github.com/kevinhwang91/rnvimr)

| 快捷键          | 描述          |
|-----------------|---------------|
| `space` `e` `e` | 打开 `rnvimr` |
| `q`             | 退出 `rnvimr` |

其他使用和 `ranger` 一样。

在 `plugin/rnvimr.vim` 文件中可以修改配置。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="./images/rnvimr.gif" alt="rnvimr" />
</details>

### 代码片段 - coc-snippets

---

**插件地址**：[neoclide/coc-sinppets](https://github.com/neoclide/coc-snippets)

在 `UltiSnips` 目录下可以添加自定义的代码片段。

例：

添加一个 `shell` 脚本的开头的代码片段：`sh.sinppets`。

```sh
snippet sh "shell heading" b
#!/bin/bash

# Author: ${1:gin}
# CreateDate: <++>
# Description: <++>

<++>
endsnippet
```

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="./images/snippet.gif" alt="snippet" />
</details>

### 终端 - vim-floaterm

---

**插件地址**：[voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)


| 快捷键          | 描述                         |
|-----------------|------------------------------|
| `space` `f` `t` | 普通模式下，打开终端         |
| `space` `f` `n` | 普通模式下，打开一个新终端   |
| `space` `f` `k` | 普通模式下，关闭所有终端     |
| `alt` `t`       | 终端模式下，隐藏终端         |
| `alt` `p`       | 终端模式下，切换到上一个终端 |
| `alt` `n`       | 终端模式下，切换到下一个终端 |

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="./images/floaterm.gif" alt="floaterm" />
</details>

## 5. Markdown 支持

### 快速输入

---

在 `插入模式(insert-mode)` 下，`markdown` 文件中输入：

| 快捷键          | 描述           |
|-----------------|----------------|
| `h1`            | 输入一级标题   |
| `h2`            | 输入二级标题   |
| `h3`            | 输入三级标题   |
| `h4`            | 输入四级标题   |
| `h5`            | 输入五级标题   |
| `h6`            | 输入六级标题   |
| `image`         | 插入图片       |
| `block`         | 插入代码块     |
| `mark`          | 使用反引号包裹 |
| `table`         | 插入表格       |
| `link`          | 插入链接       |
| `line`          | 插入分隔线     |
| `bold`          | 输入粗体文本   |
| `italic`        | 输入斜体文本   |
| `boldAndItalic` | 输入粗斜体文本 |
| `deleteLine`    | 输入删除线     |

在 `my-snippets/snippets/markdown.json` 文件中可以修改配置。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="https://github.com/GIN-18/readme-image/blob/master/nvim/md-quick-input.gif?raw=true" alt="md-quick-input" />
</details>

### Markdown 预览

---

**插件地址**：[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

| 快捷键      | 描述       |
| ----------- | ---------- |
| `shift` `r` | 打开预览   |

配置中使用 `microsoft-edge-beta` 浏览器作为预览工具。

在 `init.vim` 文件中可以找到关于 `markdown-preview` 的配置并修改。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="https://github.com/GIN-18/readme-image/blob/master/nvim/markdown-preview.gif?raw=true" alt="markdown-preview" />
</details>

### 表格模板

---

**插件地址**：[dhruvasagar/vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

| 快捷键            | 描述             |
|-------------------|------------------|
| `alt` `shift` `t` | 启动表格模板     |
| `alt` `shift` `r` | 表格模板重新对齐 |

在 `init.vim` 文件中可以找到关于 `table-mode` 的配置并修改。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="https://github.com/GIN-18/readme-image/blob/master/nvim/table-mode.gif?raw=true" alt="table-mode" />
</details>

### 从剪贴板插入图片

---

**插件地址**：[ferrine/md-img-paste.vim](https://github.com/ferrine/md-img-paste.vim)

| 快捷键          | 描述           |
|-----------------|----------------|
| `space` `p` `i` | 输入图片的名称 |

在 `init.vim` 文件中可以找到关于 `md-img-paste` 的配置并修改。

<details>
    <summary><strong>Demo (click to expand)</strong></summary>
    <img src="https://github.com/GIN-18/readme-image/blob/master/nvim/md-img-paste.gif?raw=true" alt="md-img-paste" />
</details>
