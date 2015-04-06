MarkdownReflinkView = require './markdown-reflink-view'
{CompositeDisposable} = require 'atom'

module.exports = MarkdownReflink =
  markdownReflinkView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @markdownReflinkView = new MarkdownReflinkView(state.markdownReflinkViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @markdownReflinkView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'markdown-reflink:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @markdownReflinkView.destroy()

  serialize: ->
    markdownReflinkViewState: @markdownReflinkView.serialize()

  toggle: ->
    console.log 'MarkdownReflink was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
