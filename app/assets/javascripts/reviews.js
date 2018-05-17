
$(document).ready(function() {
	attachListeners();
})

function attachListeners() {
	$(document).on('click', '#more-reviews', function(e) {
		e.preventDefault();
		$('#landmark-reviews').empty();
		const url = this.href
		$.get(`${url}.json`, function(reviews) {
			reviews.forEach(review => {
				const viewReview = new Review(review.id, review.user.id, review.user.name, review.landmark.id, review.landmark.name, review.content, review.created_at, review.cu)
				$('#landmark-reviews').append(viewReview.renderReview());
			})
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
		const reviewNum = parseInt($(this).attr("data-id"))
		$.get(`${editUrl}`, function(data) {
			$(`#review-content-${reviewNum}`).html(data)
		});
	});

	$(document).on('submit', '#new_review', function(e){
		e.preventDefault(); 
		let url = $(this).attr('action');
		let data = $(this).serializeArray();
		$.post(url, data).done(function(rev) {
			newRev = new Review(rev.id, rev.user.id, rev.user.name, rev.landmark.id, rev.landmark.name, rev.content, rev.created_at, rev.cu);
			$('#landmark-reviews').append(newRev.renderReview());
			$('#new-review-form').empty();
		});
	});

	$(document).on('submit', '.edit_review', function(e) {
		e.preventDefault();
		let patchUrl = $(this).attr('action');
		let newContent = this[5].value
		$.ajax({
			type: 'PATCH',
			url: patchUrl,
			data: {review: {content: newContent}}
		}).done(function(data) {
			$(`#review-content-${data.id}`).html(data.content)
		})
	})

	$(document).on('click', '.delete-review', function(e) {
		e.preventDefault();
		const deleteUrl = this.href
		const deleteId = parseInt($(this).attr("data-id"))
		alert('Are you sure you want to delete your review?')
		$.ajax({
			url: deleteUrl,
			type: 'post',
			data: {_method: 'delete'}
		}).done(function(data){
			$(`#whole-review-${deleteId}`).empty();
		})
		
	})
}

class Review {
		constructor(reviewId, userId, userName, landmarkId, landmarkName, content, createdAt, cu) {
			this.reviewId = reviewId
			this.userId = userId;
			this.userName = userName
			this.landmarkId = landmarkId;
			this.landmarkName = landmarkName
			this.content = content
			this.createdAt = createdAt
			this.currentUser = cu
		}
	}

	Review.prototype.renderReview = function() {
			let postTime = moment(this.createdAt).format('LLL')
			let reviewBody = `
				<h3> On <a href='/landmarks/${this.landmarkId}'>${this.landmarkName}</a>, ${this.userName} says: </h3>
				<p id="review-content-${this.reviewId}">${this.content}</p>
				<h6><em>Review posted ${postTime}</em></h6>
				
		<br /> `
			let buttons = ''
			if (this.currentUser.id === this.userId) {
				buttons = `
					<a href="/landmarks/${this.landmarkId}/reviews/${this.reviewId}/edit", data-id="${this.reviewId}", class="edit-review btn btn-default btn-xs">Edit</a>
					<a href="/users/${this.userId}/reviews/${this.reviewId}", data-id="${this.reviewId}", class="delete-review btn btn-danger btn-xs">Delete</a>`
			}
			return reviewBody + buttons;
		}	



