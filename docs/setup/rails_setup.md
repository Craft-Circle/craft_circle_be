## **Rails Setup**
1. Create a Base Directory
* On your local machine open a terminal session and enter the following commands to create a base directory for the app.

```shell
$ mkdir craft_circle
$ cd craft_circle
```

2. Clone these repositories:
* On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the back end repositiory.

- using ssh key <br>
```shell
$ git clone git@github.com:Craft-Circle/craft_circle_be.git
```

- using https <br>
```shell
$ git clone https://github.com/Craft-Circle/craft_circle_be.git
```

* Once cloned, you'll have a new local copies of the directories you ran the clone command in. You can check what is in the directory by running the following command<br>

```sh
$ ls
#ex.
  craft_circle_be craft-circle-ui
```

4. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

* If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

* There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).
<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 13.0.6
Using concurrent-ruby 1.1.10
...
...
...
Using simplecov_json_formatter 0.1.4
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Using standard 1.12.1
Bundle complete! 23 Gemfile dependencies, 94 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

</p>
</details></br>

* If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

5. Database Migration & Seeding<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db:{create,migrate,seed}
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
Created database 'craft_circle_be_development'
Created database 'craft_circle_be_test'
== 20220708032148 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0066s
== 20220708032148 CreateUsers: migrated (0.0067s) =============================

== 20220708032537 CreateItems: migrating ======================================
-- create_table(:items)
   -> 0.0110s
== 20220708032537 CreateItems: migrated (0.0110s) =============================
```

</p>
</details></br>

6. Startup and Access<br>
<p>
  In `/config/puma.rb`, you'll notice that the port has changed from 3000 to 5000. This should be on or around line 12.
</p>

```ruby
port  ENV.fetch("PORT") { 5000 }
```

<p>
  We do this because [CraftCircle BE](https://github.com/Craft-Circle/craft_circle_be) is not in production or hosted somewhere other than localhost. If Gear Up BE is running on `port 3000`, our front end will need to have a different port so they can run at the same time. Now, when we do `rails s`, our back end application will automatically use port 5000. You can also do this manually every time you start your server by passing the port number with a `-p` flag like so:
</p>

```sh
`rails s -p 5000`.
```

* You should see that your server is `"listening on tcp://localhost:5000"` now instead of the usual 3000.


**In order for your frontend to properly get data from your backend Craft Circle API, you must keep your backend server running locally at the same time.**

* Finally, in order to use the web app you will have to start the both Craft Circle Be and Craft Circle UI servers
- Start the back end server in a seperate terminal window

```shell
$ rails s
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
=> Booting Puma
=> Rails 5.2.8 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:5000
Use Ctrl-C to stop
```

</p>
</details></br>


* Switch to a new tab `CMD + T` in your terminal then navigate to the front end directory with the command:

```sh
$ cd ../craft-circle-ui
```

* Your file patch in your new tab in terminal should be `./craft_circle/craft-circle-ui`. Start the front end server

```sh
$ npm start
```

* Open web browser and visit link to access the front end application
    http://localhost:3000

* You may now run the front-end and open it on `localhost:3000` and it will make GraphQL queries to the Rails server at `localhost:3001/graphql`.

* You can shut down either server process by entering Cmd-C in the terminal window.

## Test Suite
Run the test suite with:
```
bundle exec rspec
```

To access test coverage files, run:
```
open coverage/index.html
```
