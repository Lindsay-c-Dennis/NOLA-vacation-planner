# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship - user has_many visits, user has_many reviews, landmark has_many reviews, etc
- [x] Include at least one belongs_to relationship - visit belongs_to user and landmark, landmark belongs_to neigborhoood
- [x] Include at least one has_many through relationship - user has many landmarks through reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute - review join table has content attribute
- [x] Include reasonable validations for simple model objects - user requires name, password_digest, categories, neighborhoods, landmarks require unique names
- [x] Include a class level ActiveRecord scope method - recent_reviews is a scope method that displays the three most recently created reviews
- [x] Include signup - built my own user controller
- [x] Include login - built my own sessions controller
- [x] Include logout - sessions controller destroy method, button_to delete
- [x] Include third party signup/login - omniauth-google
- [x] Include nested resource show or index -reviews nested through landmarks and users for index
- [x] Include nested resource "new" form - new review form nested under landmarks
- [x] Include form display of validation errors - if an object is not successfully created, the page renders with a bulleted list of errors

Confirm:
- [x] The application is pretty DRY - it could always be better, but I created partials for errors and repeated view code, and helper methods for repeated method code
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate - helper method for review timestamp
- [x] Views use partials if appropriate - forms, errors, review index
