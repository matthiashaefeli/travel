window.inputForm = (e, link) => {
  e.preventDefault();
  if ($('#travelTimeForm').length == 0) {
    const link_parent = $(link).closest('p')
    $.ajax({
      type: "get",
      url: link.href,
      success: function (response) {
        $(response).insertAfter(link_parent);
        $('#start_point').focus();
      }
    });
  }
}

window.cancelForm = (e, button) => {
  e.preventDefault();
  $(button).closest('form').remove();
}