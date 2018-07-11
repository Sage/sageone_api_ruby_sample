# Sage One Ruby API Sample application

Sample application that integrates with Sage One Accounting via the Sage One API.

Authentication with Sage One is handled in the [Sage One Controller](app/controllers/sage_one_controller.rb).

## Run the app locally

Clone the repo:

`git clone git@github.com:Sage/sageone_api_ruby_sample.git`

Update the [config/sageone.yml](config/sageone.yml) file with your application's `client_id`, `client_secret` and
`apim_subscription_key`.

Switch to the project directory, bundle and migrate the db:

```
cd sageone_api_ruby_sample
bundle install
bundle exec rake db:migrate
```

Start a local Rails server:

```
bundle exec rails s
```

You can now access the [home page](http://localhost:3000/), sign up, authorize and make an API call.
