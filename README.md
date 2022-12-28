# NeoVim configuration for Modern Web/Mobile Development

Configure NeoVim for Web, and specially WordPress, development.

![Screenshot of NeoVim](screenshot.png)

This is a permanent _Work In Progress_.

If you are interested in the rest of my setup, you can visit my [dotfiles repo](https://github.com/marioy47/dotfiles).

**Look at the [keymaps](lua/keymaps.lua) and [commands](lua/commands.lua) files to find out which commands and key maps are available.**

## Requirements

- NeoVim at least version 0.8
- Git
- (Optional) [Stylua](https://github.com/johnnymorganz/stylua) for linting of `.lua` files
- (Optional) [PHPCS and PHPCBF](https://github.com/squizlabs/PHP_CodeSniffer) for PHP linting and formatting
- (Optional) [eslint_d](https://github.com/mantoni/eslint_d.js) for faster JavaScript linting and diagnostics
- (Optional) [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) for markdown formatting and linting

If you are on a Mac:

```bash
brew install stylua composer node
export PATH=~/.composer/vendor/bin:$PATH # You should make this permanent somehow
composer global require squizlabs/php_codesniffer
npm install -g markdownlint-cli eslint_d
```

## NPM commands

There is a [pacakge.json](package.json) file with commands for linting and formtting the code. It's not actually required.

- `npm run lint` will show any linting errors on the markdown and lua files
- `npm run format` will reformat the markdown and lua files
- `npm run setup` will open up NeoVim and install all the plugins

## LSP Support for additional languages

The current setup will try to install some LSP servers for you: `bash`, `intelephenese` (for PHP), `tsserver` (for JavaScript), etc. You can add/remove which languages will get installed by default by changing the `vim.g.lsp_servers` variable in [`init.lua`](init.lua). You can figure out which servers are available by visitint the [Nvim LSP Installer](https://github.com/williamboman/nvim-lsp-installer#available-lsps) page.

## TODO

- [ ] Configure language server [using json](https://github.com/tamago324/nlsp-settings.nvim) instead of lua (allows you to have config per-project)
- [ ] Format does not work with Guttenberg
