  $(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/neighborhoods/" + nextId + ".json", function(data) {
      let neighborhood = data;
      let landmarks = neighborhood["landmarks"]
      
      $('#list-landmarks').empty();
      landmarks.forEach(listLandmark);
      function listLandmark(landmark) {
        $('#list-landmarks').append(`<li><h3><a href="/landmarks/${landmark.id}">${landmark.name}</a></h3></li>`)
      }
      
      $(".neighborhoodName").text(neighborhood["name"]);
      $(".neighborhoodDescription").text(neighborhood["description"]);
      $(".neighborhoodImage img").attr("src", neighborhood["image_link"]);
      $(".edit-neighborhood a").attr("href", `/neighborhoods/${nextId}/edit`)

      // re-set the id to current on the link
      $(".js-next").attr("data-id", neighborhood["id"]);
    });
  });
});