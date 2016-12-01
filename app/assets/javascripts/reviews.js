function createGmap(dataFromServer) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'restaurant_map'}
    },
    function() {
      markers = handler.addMarkers(dataFromServer);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
};

function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#restaurant_map').length > 0) {
    // Access the data-apartment-id attribute on the map element
    var reviewId = $('#restaurant_map').attr('data-review-id');

    $.ajax({
      dataType: 'json',
      url: '/reviews/' + reviewId + '/map_location',
      method: 'GET',
      success: function(dataFromServer) {
        createGmap(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmap);
// Create the map when the contents is loaded using turbolinks
// To be 'turbolinks:load' in Rails 5
//$(document).on('page:load', loadAndCreateGmap);
// To be 'turbolinks:load' in Rails 4
//$(document).on('turbolinks:load', loadAndCreateGmap);
