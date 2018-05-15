
$(document).ready(function() {
	attachListeners();
})

function attachListeners() {
	$(document).on('click', '#more-reviews', function(e) {
		e.preventDefault();
		$('#landmark-reviews').empty();
		const url = this.href
		$.get(`${url}.json`, function(reviews) {
			debugger
			reviews.forEach(renderReview);
		});
	});

	$(document).on('click', "#add-review", function(e){
		e.preventDefault();
		const newUrl = this.href
		$.get(`${newUrl}`, function(data) {
			$('#new-review-form').html(data);
		});
	});

	$(document).on('click', ".edit-review", function(e) {
		e.preventDefault();
		const editUrl = this.href
		$.get(`${editUrl}`, function(data) {
			//debugger
			$('#review-content').html(data)
		});
	});

	
	$(document).on('submit', '#new_review', function(e){
		debugger
		e.preventDefault(); 
		let url = $(this).attr('action')
		let landmarkId = $('#review_landmark_id').val();
		let userId = $(this).find('#review_user_id').val();
		let reviewText = $(this).find('#review_content').val();
		let data = $(this).serializeArray();
		$.post(url, data).done(function(review) {
			debugger
			$('#landmark-reviews').prepend(renderReview(review));
			$('#new-review-form').empty();
		});
	});
				


}

function printReview(review) {
	$('#landmark-reviews').append(`<li><strong>${review.user.name} says:</strong> ${review.content}</li>`);
}

function renderReview(review) {
			let postTime = moment(review.created_at).format('LLL')
			return `
				<h3> On <a href='/landmarks/${review.landmark.id}'>${review.landmark.name}</a>, ${review.user.name} says: </h3>
				<p>${review.content}</p>
				<h6><em>Review posted ${postTime}</em></h6>
				
		<br /> `
		}
