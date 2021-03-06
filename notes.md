Project Requirements
- model must include:
        at least one has_many
        at least one belongs to 
        at least two has many through relationships
        include a many to many relationship impletmented with has_many :through associations. Some attribute other than its foreign keys that can be submitted by the user
- model must include reasonable validations 
- at least one class level scope method (must use activerecord query methods within it such as where, order instead of ruby methods like find all and sort)
- user authentication at signup, login, logout, passwords
- authentication through google, fb, or twitter
- make use of nested resource
            nested new route that relates to parent resource
            nested index or show route

- forms display validation errors
          fields should be enclosed within a fields_with_errors class
          error messages describing validation failures must be in view
- Do Not Repeat Yourself 
          logic in controllers are methods in models
          views use helper methods and partials when approproate
          




Notes
Things that don't work
create function in ratings controller
login via omniauth 
how to create a book
