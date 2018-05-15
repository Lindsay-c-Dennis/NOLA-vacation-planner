
$(document).ready(function() {
	attachListeners();
})

function attachListeners() {
	$(document).on('click', '#more-reviews', function(e) {
		e.preventDefault();
		$('#landmark-reviews').empty();
		const url = this.href
		$.get(`${url}.json`, function(reviews) {
			//debugger
			reviews.map(review => renderReview(review));
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
			$('#review-content').html(data)
		});
	});

	$(document).on('submit', '#new_review', function(e){
		e.preventDefault(); 
		let url = $(this).attr('action')
		let landmarkId = $('#review_landmark_id').val();
		let userId = $(this).find('#review_user_id').val();
		let reviewText = $(this).find('#review_content').val();
		let data = $(this).serializeArray();
		$.post(url, data).done(function(review) {
			newRev = new Review(review.user.id, review.user.name, review.landmark.id, review.landmark.name, review.content, review.created_at);
			$('#landmark-reviews').prepend(newRev.renderReview());
			$('#new-review-form').empty();
		});
	});

	$(document).on('submit', '.edit_review', function(e) {
		e.preventDefault();
		let patchUrl = $(this).attr('action');
		let editData = $(this).serializeArray();
		debugger
		$.ajax({
			type: 'PATCH',
			url: patchUrl,
			data: editData
		});
	})
}

class Review {
		constructor(userId, userName, landmarkId, landmarkName, content, createdAt) {
			this.userId = userId;
			this.userName = userName
			this.landmarkId = landmarkId;
			this.landmarkName = landmarkName
			this.content = content
			this.createdAt = createdAt
		}
	}

	Review.prototype.renderReview = function() {
			debugger
			let postTime = moment(this.createdAt).format('LLL')
			return `
				<h3> On <a href='/landmarks/${this.landmarkId}'>${this.landmarkName}</a>, ${this.userName} says: </h3>
				<p>${this.content}</p>
				<h6><em>Review posted ${postTime}</em></h6>
				
		<br /> `
		}	

function printReview(review) {
	$('#landmark-reviews').append(`<li><strong>${review.user.name} says:</strong> ${review.content}</li>`);
}


