window.inputForm = () => {
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

window.cancelForm = () => {
  $('#travelTimeForm').remove();
  $('#travelTimeFormLink').show();
  $('#travelTimeError').html('').hide();
}

window.createTravelTime = (e) => {
  e.preventDefault();
  $('#travelTimeError').html('').hide();
  if ($('#start_point').val() === '' || $('#end_point').val() === '') {
    $('#travelTimeError').html('Please enter Start and End Location').show();
  } else {
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
}

window.delete_travel_time = (travel_time_id, trash) => {
  const row = $(trash).closest('tr');
  $.ajax({
    url: '/travel_times/' + travel_time_id,
    method: 'delete',
    success: function(response) {
      row.remove();
    }
  })
}