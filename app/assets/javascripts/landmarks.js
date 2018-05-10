$(document).ready(function() {
	attachListeners();
});

function attachListeners() {
	$('#view-cats').on('click', function(e) {
		e.preventDefault();
		showCats();
	});
}

function showCats() {
	$.get('/categories', (categories) => {
		console.log(categories);
	});	
}