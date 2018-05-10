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
		categories.forEach(buildCatLink);
	});	
}

function buildCatLink(category) {
	$('#categories').append(`<li><a href="/categories/${category.id}">${category.name}</a></li>`);
}