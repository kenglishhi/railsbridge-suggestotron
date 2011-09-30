# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $('a.vote-for').click(->
    link = $(this)
    data = $.post(this.href, (data)->
      link.closest('.topic').find('.number-of-votes:first').html(data.number_of_votes)
    )
    false
  )
)