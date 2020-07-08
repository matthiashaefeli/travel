window.inputForm = () => {
  if ($('#travelTimeForm').length == 0) {
    $.ajax({
      type: 'get',
      url: '/travel_times/new',
      success: function (response) {
        $(response).insertAfter($('#travelTimeFormLink'));
        $('#travelTimeFormLink').hide();
        $('#start_point').focus();
      }
    });
  }
}

window.cancelForm = () => {
  $('#travelTimeForm').remove();
  $('#travelTimeFormLink').show();
  $('#travelTimeError').html('').hide();
}

window.createTravelTime = () => {
  $('#travelTimeError').html('').hide();
  const form = $('#travelTimeForm')[0];
  $.ajax({
    url: form.action,
    method: form.method,
    data: $(form).serialize(),
    success: function(response) {
      if (response.error) {
        $('#travelTimeError').html(response.error).show();
      } else {
        $('.travelTimeTableBody').prepend(response);
        cancelForm();
      }
    }
  })
}