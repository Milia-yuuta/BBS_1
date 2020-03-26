# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#article-tags').tagit
    fieldName:   'name'
    singleField: true
  $('#article-tags').tagit()
  category_string = $("#category_hidden").val()
  try
    name = category_string.split(',')
    for tag in name
      $('#article-tags').tagit 'createTag', tag
  catch error