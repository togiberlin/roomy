# Roomy
> A P2P room booking app, written in Ruby on Rails

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
- Because our application runs on ```localhost:3000/```, there is no way that PayPal can send a payment confirmation to our app.
- There are 2 solutions. Deployment to e.g. Heroku, which requires some work. Way easier: using a webservice that allows connections to your localhost webapp.
- In order to allow connections to your localhost app, download Ngrok from [here](https://ngrok.com/)
- Unzip the file, right click on it and open it with Terminal. A ```complete``` message should appear
- If you don't have a PayPal account, register and open up a personal account [here](https://www.paypal.com)
- Go to [developer.paypal.com](https://developer.paypal.com) and login
- Create an app called ```Roomy```
- Go to the Sandbox test accounts page. There should be 2 accounts: one facilitator (business) and one buyer (private) account.
- Click on ```profile``` on the private account and change the password. Make sure, that the buyer account has a balance of 9999 EUR/USD
- Navigate to the download folder via ```cd ~/Downloads```, then enter ```./ngrok http 3000``` to start the Ngrok server
- Ngrok displays now a link, with which the internet can reach your localhost application. Start your Rails server, and copy/paste the Ngrok link into the browser. Your webapp should appear on the internet!
-