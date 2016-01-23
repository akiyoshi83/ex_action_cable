# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  App.sourceEditor = App.editor.init id: "editor"

$(document).on 'click', '#save', (event) ->
  event.preventDefault()
  id = $('#source_id').val()
  name = $('#source_name').val()
  code = App.sourceEditor.getValue()
  language_id = $('#source_language_id').val()
  App.editor.save id, name, code, language_id
  false

$(document).on 'click', '[data-source]', (event) ->
  event.preventDefault()
  id = event.target.dataset.source
  App.editor.source(id)
  false

$(document).on 'click', '[data-remove-source]', (event) ->
  event.preventDefault()
  id = event.target.dataset.removeSource
  if confirm I18n.t("confirm.remove_source", I18n.viewScope)
    App.editor.remove(id)
  false

