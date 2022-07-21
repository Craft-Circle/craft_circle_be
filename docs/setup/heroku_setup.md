## **Heroku Setup**
* If this is your first time setting up a Heroku server. Take your time to read these documents [Heroku Getting Started w/ Rails](https://devcenter.heroku.com/articles/getting-started-with-rails5) to familiarize yourself.<br>

1. [Deploy Application to Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku) is where you want to be after an account is created because your app already exists. You want to repeat the process for the front end application as well. You can check if your app is added on heroku with this command:

```sh
$ git remote -v
```
<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
heroku	https://git.heroku.com/<your app name>.git (fetch)
heroku	https://git.heroku.com/<your app name>.git (push)
origin	git@github.com:<your github username>/craft_circle_be.git (fetch)
origin	git@github.com:<your github username>/craft_circle_be.git (push)
```

</p>
</details></br>

* If your terminal doesn't reflect the example above input this command

```sh
$ heroku git:remote -a <your app name>
```
2. Deploy your code:
```sh
$ git push heroku main -a <your app name>
```
3. Migrate and seed your database:

```sh
$ heroku run rails db:{create,migrate,seed}
```
* Once your migrations are finished run this command and after awhile your terminal will produce a similar result in the example below


<details>
<summary><b>Click to see example!</b></summary>
<p>

<a href="https://github.com/Craft-Circle/craft_circle_be/blob/68294dcf60229d5b9475500b3cb4f9d753eb0969/docs/imgs/heroku_setup.png" title ="Heroku Database"><img src="https://github.com/Craft-Circle/craft_circle_be/blob/68294dcf60229d5b9475500b3cb4f9d753eb0969/docs/imgs/heroku_setup.png" alt="Heroku Database"/></a>

</p>
</details></br>

4. Ensure your API keys are set up on your web app
```
From your Heroku dashboard, click on the project you just created, then Settings. In the Config Vars section, click Reveal Config Vars. Here, you can add any API keys with the constant name you gave them in the application.yml file created from the figaro gem.
```
