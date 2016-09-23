# vim-mode-plus-plugin-sample

This is sample project for package used as [vim-mode-plus](https://atom.io/packages/vim-mode-plus) plugins.

For more information, refer vim-mode-plus's wiki
- [Create-vmp-plugin](https://github.com/t9md/atom-vim-mode-plus/wiki/Create-vmp-plugin)
- [Extend-vmp-in-init-file](https://github.com/t9md/atom-vim-mode-plus/wiki/Extend-vmp-in-init-file)
- [List-of-vmp-plugins](https://github.com/t9md/atom-vim-mode-plus/wiki/List-of-vmp-plugins)

# How to start?

```
$ git clone https://github.com/t9md/atom-vim-mode-plus-plugin-sample
$ mv atom-vim-mode-plus-plugin-sample your-package-name
$ cd your-package-name
$ rm -rf .git
$ vi package.json # Replace 'vim-mode-plus-plugin-sample' to 'your-package-name'
$ apm link -d
$ atom -d .
```
