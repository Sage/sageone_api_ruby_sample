# Sage Business Cloud Accounting Ruby API Sample application (deprecated)

**Please note that this Sample Application is not updated anymore.** To get an overview of all current sample applications
for the Sage Accounting API, please visit https://developer.sage.com/api/accounting/guides/sample_apps/.

<details><summary>Application Setup</summary>
<p>

Sample application that integrates with Sage Business Cloud Accounting via the Sage API.

Authentication with Sage is handled in the [Controller](app/controllers/sage_accounting_controller.rb).

## Run the app locally

Clone the repo:

`git clone git@github.com:Sage/sageone_api_ruby_sample.git`

Update the [config/sage_accounting.yml](config/sage_accounting.yml) file with your application's `client_id`, `client_secret`.

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
docker build --rm -t sage_accounting/api_ruby_sample -f Dockerfile .
```

```
docker run -it --publish=3000:3000/tcp sage_accounting/api_ruby_sample
```
</p>
</details>

## License

This sample application is available as open source under the terms of the
[MIT licence](LICENSE).

Copyright (c) 2020 Sage Group Plc. All rights reserved.
