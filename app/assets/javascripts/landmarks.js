$(document).ready(function() {
	attachButtonListeners();
})

function attachButtonListeners() {
	$('#view-cats').on('click', function() {
		let button = document.getElementById("view-cats")
		let cats = document.getElementById("categories")
		if (cats.style.display === "none") {
			button.innerHTML = "Hide Categories";
			cats.style.display = "block";
		} else {
			cats.style.display = "none";
			button.innerHTML = "Show Categories";
		}
		})



}