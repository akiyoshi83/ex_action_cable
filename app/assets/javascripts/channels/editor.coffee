App.editor = App.cable.subscriptions.create "EditorChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.sources
      $('[data-source-list]').html data.sources

    if data.source
      App.sourceEditor.destroy()
      $('[data-editor]').html data.source
      App.sourceEditor = App.editor.init id: "editor"

  init: (data) ->
    ace.config.set "basePath", "assets/ace-builds/src-min/"
    editor = ace.edit data.id
    editor.setTheme "ace/theme/solarized_light"
    editor.getSession().setMode "ace/mode/golang"
    editor

  source: (id) ->
    @perform 'source', id: id

  new: ->
    @perform 'new'

  save: (id, name, code, language_id) ->
    @perform 'save', id: id, name: name, code: code, language_id: language_id

  remove: (id) ->
    @perform 'remove', id: id

