$(document).ready(function() {
	attachButtonListeners();
})

function attachButtonListeners() {
	$(document).on('click', '#view-cats', function() {
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

	$(document).on('click', '#view-neighborhoods', function() {
		let toggle = $("#view-neighborhoods")[0]
		let neigh = $("#neighborhood-list")[0]
		if (neigh.style.display === "none") {
			toggle.innerHTML = "Hide Neighborhoods";
			neigh.style.display = "block";
		} else {
			neigh.style.display = "none";
			toggle.innerHTML = "Show Neighborhoods";
		}
		})



}