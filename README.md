# vim-mode-plus-plugin-sample

This is sample project for package used as [vim-mode-plus](https://atom.io/packages/vim-mode-plus) plugins.

For more information, refer vim-mode-plus's wiki
- [CreateVimModePlusPlugin](https://github.com/t9md/atom-vim-mode-plus/wiki/CreateVimModePlusPlugin)
- [ExtendVimModePlusInInitFile](https://github.com/t9md/atom-vim-mode-plus/wiki/ExtendVimModePlusInInitFile)
- [ListOfVimModePlusPlugins](https://github.com/t9md/atom-vim-mode-plus/wiki/ListOfVimModePlusPlugins)

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
