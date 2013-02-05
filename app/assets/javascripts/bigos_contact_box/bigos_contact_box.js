$(document).ready(function() {

  $("#bigos_contact_form_submit").on("click", function() {
      form = $(this).closest("form")
      form.find("input").removeClass("invalid")
      data = $(this).closest("form").serialize()
      $("#message_status").html("")
      $.ajax({
          url: "/bigos_contact_box/messages",
          type: "GET",
          dataType: "json",
          data: data,
          success: function(data) {
              if (data == true) {
                form.submit()

              } else {
                  $.each(data, function(error) {
                    $("#message_"+error).addClass("invalid")
                  });
                  $("#message_status").html($("#invalid_fields_error").val())
                  return false
              }
          }
      });
      return false
  })

});
