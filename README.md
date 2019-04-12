# Sage Business Cloud Ruby API Sample application

Sample application that integrates with Sage Business Cloud Accounting via the Sage API.

Authentication with Sage is handled in the [Controller](app/controllers/sage_one_controller.rb).

## Run the app locally

Clone the repo:

`git clone git@github.com:Sage/sageone_api_ruby_sample.git`

Update the [config/sageone.yml](config/sageone.yml) file with your application's `client_id`, `client_secret`.

Switch to the project directory, bundle and migrate the db:

```
cd sageone_api_ruby_sample
bundle install
bin/rails db:setup
```

Start a local Rails server:

```
bin/rails server
```

You can now access the [home page](http://localhost:3000/), sign up, authorize and make an API call.

## Run the app in Docker

```
docker build --rm -t sageone/api_ruby_sample -f Dockerfile .
```

```
docker run -it --publish=3000:3000/tcp sageone/api_ruby_sample
```

## License

This sample application is available as open source under the terms of the
[MIT licence](LICENSE).

Copyright (c) 2019 Sage Group Plc. All rights reserved.
