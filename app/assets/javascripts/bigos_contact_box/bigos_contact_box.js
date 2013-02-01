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

  if ($("#contact-box-map-canvas").length > 0) {
	var latlng, map, marker, myOptions;
    latlng = new google.maps.LatLng($("#latitude").val(), $("#longitude").val());
    var map_zoom = 14
    if($("#map_zoom").length > 0) {
        map_zoom = parseInt($("#map_zoom").val())
    }
    myOptions = {
      zoom: map_zoom,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("contact-box-map-canvas"), myOptions);
    marker = new google.maps.Marker({
      position: latlng,
      title: $("#location_name").val()
    });
    marker.setMap(map);

    if($("#marker_icon").length > 0) {
      marker.setIcon($("#marker_icon").val())
    }
  }
});
