const {CompositeDisposable} = require("atom")

module.exports = {
  activate() {
    this.subscriptions = new CompositeDisposable()
  },

  deactivate() {
    this.subscriptions.dispose()
  },

  consumeVimModePlus({Base, observeVimStates}) {
    const Motion = Base.getClass("Motion")
    // Add motion commands
    // -------------------------
    class MoveUp extends Motion {
      moveCursor(cursor) {
        cursor.moveUp()
      }
    }
    MoveUp.commandPrefix = "vim-mode-plus-user"

    class MoveDown extends MoveUp {
      moveCursor(cursor) {
        cursor.moveDown()
      }
    }

    this.subscriptions.add(
      MoveUp.registerCommand(), // 'vim-mode-plus-user:move-up'
      MoveDown.registerCommand(), // 'vim-mode-plus-user:move-down'
      observeVimStates(vimState => {
        this.subscriptions.add(
          vimState.onWillActivateMode(({mode, submode}) => console.log("will-activate", {mode, submode})),
          vimState.onDidActivateMode(({mode, submode}) => console.log("did-activate", {mode, submode})),
          vimState.onDidSetMark(({name, bufferPosition, editor}) =>
            console.log(`set mark '${name}' at ${bufferPosition.toString()} for ${editor.getPath()}`)
          )
        )
      })
    )
  },
}
