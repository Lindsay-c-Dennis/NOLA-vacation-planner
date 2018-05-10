$(document).ready(function() {
	attachListeners();
});

function attachListeners() {
	$('#view-cats').on('click', function(e) {
		e.preventDefault();
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

function hideCats() {
	
}

function buildCatLink(category) {
	$('#categories').append(`<li><a href="/categories/${category.id}">${category.name}</a></li>`);
}