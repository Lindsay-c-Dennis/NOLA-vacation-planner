$(document).ready(function() {
	attachListeners();
})

function attachListeners() {
	$('#more-reviews').on('click', function(e) {
		e.preventDefault();
		$('#landmark-reviews').empty();
		const url = this.href
		$.get(`${url}`, function(reviews) {
			reviews.forEach(printReview);
		});
	});
}

function printReview(review) {
	$('#landmark-reviews').append(`<li><strong>${review.user.name} says:</strong> ${review.content}</li>`);
}
