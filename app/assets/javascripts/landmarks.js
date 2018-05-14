$(document).ready(function() {
	attachButtonListeners();
})

function attachButtonListeners() {
	$('#view-cats').on('click', function() {
		let button = $("#view-cats")[0]
		let cats = $("#categories")[0]
		if (cats.style.display === "none") {
			button.innerHTML = "Hide Categories";
			cats.style.display = "block";
		} else {
			cats.style.display = "none";
			button.innerHTML = "Show Categories";
		}
		})



}