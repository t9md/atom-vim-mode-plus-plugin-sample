{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @subscriptions = new CompositeDisposable

  deactivate: ->
    @subscriptions.dispose()
    {@subscriptions, @emitter} = {}

  subscribe: (args...) ->
    @subscriptions.add args...

  consumeVimModePlus: (service) ->
    {Base, observeVimStates} = service
    Motion = Base.getClass('Motion')

    # Add motion commands
    # -------------------------
    # - 'vim-mode-plus-user:my-move-up'
    # - 'vim-mode-plus-user:my-move-down'
    class MyMoveUp extends Motion
      @commandPrefix: 'vim-mode-plus-user'
      moveCursor: (cursor) ->
        cursor.moveUp()

    class MyMoveDown extends MyMoveUp
      moveCursor: (cursor) ->
        cursor.moveDown()

    @subscribe(
      MyMoveUp.registerCommand()
      MyMoveDown.registerCommand()
    )

    @subscribe observeVimStates (vimState) =>
      editor = vimState.editor
      vimState.onDidSetMark ({name, bufferPosition}) =>
        msg = "Mark '#{name}' on #{bufferPosition.toString()} on #{editor.getPath()}"
        @log(msg)

  log: (msg) ->
    console.log msg
