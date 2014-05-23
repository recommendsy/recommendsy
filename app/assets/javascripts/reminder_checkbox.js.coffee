jQuery ->
  $('.button-checkbox').click () ->
    $reminderId = $(this).find('.reminder-checkbox').attr('id')
    $currentUserId = $('#current-user-id').text()
    $stateIconClass = $(this).find('.state-icon').attr('class')
    $active = $stateIconClass.indexOf("unchecked") < 0

    url = '/users/1/reminders'

    $.ajax({
      url: url
      type: 'post'
      data:
        user_id:     $currentUserId
        reminder_id: $reminderId
        active:      $active
      success:
        console.log('Checkbox Information Sent to ' + url + ' ' + $active)
    })