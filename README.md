# microblog

A simple microblog application, such as Twitter.

I've used the following stack:
- Rails 4.2.1
- Ruby 2.1.5
- RSpec 3
- Twitter Bootstrap 3

**Admin**

I've used RailsAdmin just to simulates a simple admin interface. It can be accessed by /admin

The application is pretty straightforward, a service similar to Twitter.
All the application is tested. I've tried to use a clean design.


## Set up

```
bundle install
rake db:setup
```

*Login*

There is already a user for testing.

```
e-mail: user@gmail.com
password: 123456678
```

*Admin login*

```
e-mail: admin@gmail.com
passowrd: 123456678
```

(to create admin users, you should use the admin interface to do that - the sign up should not work intentionally)
