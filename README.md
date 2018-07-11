# Sage Business Cloud Ruby API Sample application

Sample application that integrates with Sage Business Cloud Accounting via the Sage API.

Authentication with Sage is handled in the [Controller](app/controllers/sage_one_controller.rb).

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

## License

This sample application is available as open source under the terms of the
[MIT licence](LICENSE).

Copyright (c) 2018 Sage Group Plc. All rights reserved.
