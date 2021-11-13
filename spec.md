# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
## This is a rails project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
## Category model has many Accounts
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
## Account model belongs_to both Category and User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
## Category has many users through accounts.  Users has many Categories through accounts.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
## Category has many users through accounts.  Users has many Categories through accounts.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
## Account model includes dollar_value and type attributes
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
## validations User (presence: username, email)(uniqueness: username, email)
## validations on Account (presence: name, dollar_value, account_type)
## validations on Category (presence: name)(uniqueness: name)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
##created admin "home" route (.e.g. /admin/home)
- [x] Include signup (how e.g. Devise)
## signup tested and working
- [x] Include login (how e.g. Devise)
## login tested and working
- [x] Include logout (how e.g. Devise)
## logout tested and working
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
## Omniauth is working correctly with facebook. Able to create new user when logging in and also retrieve user.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
##user account show (e.g. user/1/account/1)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
##user account new (.e.g. user/1/account/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
##validation errors display on forms for Categories, Users, and Accounts

Confirm:
- [x] The application is pretty DRY
## used _form for form generation and even created a custom layout "_errors.html.erb" to prevent repeating error generation code.
- [x] Limited logic in controllers
##reviewed and believe logic is limited and each method has a singular purpose
- [x] Views use helper methods if appropriate
##admin view has multiple helper methods used.
##categories views have multiple helper methods used
- [x] Views use partials if appropriate
## partials used when doing new/edit forms and also created a _errors layout to prevent having to repeat error generation code
