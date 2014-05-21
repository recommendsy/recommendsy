$(document).ready () ->
  $('#etsy_poke').click () ->
    user_id = $('#user_id').text()
    url = '/users/' + user_id + '/poke'
    $.ajax({
      url: url
    })