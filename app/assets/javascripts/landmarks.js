$(document).ready(function() {
	attachButtonListeners();
})

function attachButtonListeners() {
	$('#view-cats').on('click', function() {
		showCats();
	});

	$('#hide-cats').on('click', function() {
			$('#categories').empty();
		});
}

function showCats() {
	$.get('/categories', (categories) => {
		categories.forEach(buildCatLink);
	});	
}

function buildCatLink(category) {
	$('#categories').append(`<li><h4><a href="/categories/${category.id}">${category.name}</a></h4></li>`);
}