$(function () {
  $(document).on("click", ".js-next", function(e) {
    e.preventDefault();
    let nextId = parseInt($(".js-next").attr("data-id")) + 1;
    renderNeighborhood(nextId)
    });

    $(document).on("click", ".js-prev", function(e) {
      e.preventDefault();
      let prevId = parseInt($(".js-prev").attr("data-id")) - 1;
      //debugger
      renderNeighborhood(prevId)
    });
});


  function renderNeighborhood(newId) {
    $.get("/neighborhoods/" + newId + ".json", function(data) {
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
      $(".edit-neighborhood a").attr("href", `/neighborhoods/${newId}/edit`)
      $(".js-prev").attr("data-id", neighborhood["id"]);
      $(".js-next").attr("data-id", neighborhood["id"]);  
  });
}