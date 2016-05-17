{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @subscriptions = new CompositeDisposable

  deactivate: ->
    @subscriptions.dispose()
    {@subscriptions} = {}

  subscribe: (args...) ->
    @subscriptions.add args...

  consumeVimModePlus: (service) ->
    {Base, observeVimStates} = service
    Motion = Base.getClass('Motion')

    # Add motion commands
    # -------------------------
    class MoveUp extends Motion
      @commandPrefix: 'vim-mode-plus-user'
      moveCursor: (cursor) ->
        cursor.moveUp()

    class MoveDown extends MoveUp
      moveCursor: (cursor) ->
        cursor.moveDown()

    # When you call registerCommand your class name(MoveUp and MoveDown here) is
    # transformed to dash-case string by prefixing @commandPrefix.
    # So following two commands are defined.
    #  - 'vim-mode-plus-user:move-up'
    #  - 'vim-mode-plus-user:move-down'
    @subscribe(
      MoveUp.registerCommand()
      MoveDown.registerCommand()
    )

    @subscribe observeVimStates (vimState) =>
      vimState.onDidSetMark ({name, bufferPosition, editor}) =>
        msg = "Mark '#{name}' on #{bufferPosition.toString()} on #{editor.getPath()}"
        @log(msg)

  log: (msg) ->
    console.log msg
