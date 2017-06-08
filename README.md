# Roomy
> A room booking app, written in Ruby on Rails

## Prerequisites
- Make sure, to have [Ruby installed](https://www.ruby-lang.org/en/documentation/installation/).
- To handle different Ruby versions on the same machine, I recommend installing a Ruby version manager like [rbenv](https://github.com/rbenv/).

## Running the Application
- Fork the application
- Clone your fork to your machine via ```git clone link_to_forked_repo_here```
- _Optional_: add this repo as upstream via ```git remote add upstream https://github.com/togiberlin/roomy.git```
- Check remote repos via ```git remote -v```
- Type ```bundle install``` to install dependencies
- Then enter ```rackup private_pub.ru -s thin -E production``` to allow some WebSocket magic to happen
- In the last step, type ```bundle exec rails s``` to start the Rails server
- Open your browser on ```localhost:3000```

## Extra Features
### Transactional E-Mails
[...Authentication e-mails via Sendgrid, Mandrill tbd ...]

### Login with Facebook
[...tbd...]

### Avatar
[...Gravatar tbd...]

### PayPal Integration
[...tbd...]