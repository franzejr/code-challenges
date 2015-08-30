# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  supportOnInput = "oninput" of document.createElement("input")
  $("input[maxlength]").each ->
    $this = $(this)
    maxLength = parseInt($this.attr("maxlength"))
    $this.attr "maxlength", null
    el = $("<span class=\"character-count badge pull-right\">" + maxLength + "</span><br/>")
    el.insertAfter $this
    $this.bind (if supportOnInput then "input" else "keyup"), ->
      cc = $this.val().length
      el.text maxLength - cc
      if maxLength < cc
        el.css "color", "red"
      else
        el.css "color", null

