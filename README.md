# **Craft Circle BE**

![languages](https://img.shields.io/github/languages/top/Craft-Circle/craft_circle_be?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
![graphql](https://img.shields.io/badge/GraphQL-2.0.11-blueviolet)<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-4-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
![postgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

<hr>

<p align="center">
  <a href="https://craft-circle.herokuapp.com"> <img src="./docs/imgs/CraftCircleLogoBanner-19.png" alt="logo" width="95%"/></a>
</p>

<hr>

## **Background and Description**
[Craft Circle BE](https://github.com/Craft-Circle/craft_circle_be) is the "Back End" rails application API that acts as a microservice for the [Craft Circule UI](https://github.com/Craft-Circle/craft-circle-ui) web application. The database is accessed through GraphQL endpoint where a post request has acceess to queries and muations.
- [Craft Circle App](https://craft-circle.herokuapp.com)<br>
- [Capstone Project](https://mod4.turing.edu/projects/capstone/)<br>
- [Figma Board](https://www.figma.com/files/team/1126568384966913890/Craft-Circle?fuid=1042180732312868322)<br>

---
## **Table of Contents**
- [Background and Description](#background-and-description)
- [Schema](#schema)
- [Requirements and Setup (for Mac):](#requirements-and-setup-for-mac)
    - [Ruby and Rails Versions](#ruby-and-rails-versions)
    - [Gems Utilized](#gems-utilized)
    - [SetUp](#setup)
- [Heroku Setup](#heroku-setup)
- [GraphQL Endpoints](#graphql-endpoints)
- [Contributors](#contributors-)
---
## **Schema**
![plot](./docs/imgs/craft_circleschema.png)

## **Requirements and Setup (for Mac):**

### **Ruby and Rails Versions**
---
- Ruby Version 2.7.4
- Rails Version 5.2.8

### **Gems Utilized**
---
- [capybara](https://github.com/teamcapybara/capybara)
- [faker](https://github.com/faker-ruby/faker)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [faraday](https://github.com/lostisland/faraday)
- [figaro](https://github.com/laserlemon/figaro)
- [graphql](https://graphql.org/learn/)
- [graphql-ruby docs](https://graphql-ruby.org/guides)
- [graphiql-rails](https://github.com/graphql/graphiql)
- [jsonl](https://github.com/zenizh/jsonl)
- [launchy](https://github.com/copiousfreetime/launchy)
- [pry](https://github.com/pry/pry)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [simplecov](https://github.com/simplecov-ruby/simplecov)
- [rspec_junit_formatter](https://github.com/sj26/rspec_junit_formatter)
- [rspec](https://relishapp.com/rspec)

## **Setup**
See this [Rails Setup Guide](./docs/setup/rails_setup.md) for detailed instructions on how to deploy the app in a local environment.

## **Heroku Setup**
See this [Heroku Deployment Guide](./docs/setup/heroku_setup.md) for detailed instructions on how to deploy the app to heroku.
## **GraphQL Endpoints**
Our GraphQL endpoints fall into two categories: queries and mutations. For detailed examples of all the endpoints and example responses, see our [GraphQL #Endpoints Guide](./docs/graphql) or click the specific query or mutation below to go its section.

To make live queries to the GraphQL endpoint and see live schema information, setup the back-end using the [rails setup guide](./docs/setup/rails_setup.md) and access GraphiQL at `http://localhost:5000/graphiql`.

Queries
- [User Queries](./docs/graphql/queries.md#user-q)
    - [getUsers](./docs/graphql/queries.md#get-users)
    - [getAUser](./docs/graphql/queries.md#get-user)
    - [getUserItems](./docs/graphql/queries.md#get-user-items)
- [Item Queries](./docs/graphql/queries.md#item-q)
    - [getItems](./docs/graphql/queries.md#get-items)
    - [itemSearch](graphql_endpoints.md#item-search)
    - [filterByCategory](graphql_endpoints.md#filter-by-category)

Mutations
- [User Mutations](./docs/graphql/mutations.md#user-m)
    - [createUser](./docs/graphql/mutations.md#create-user)
    - [editUser](./docs/graphql/mutations.md#edit-user)
    - [deleteUser](./docs/graphql/mutations.md#delete-user)
- [Item Mutations](./docs/graphql/mutations.md#item-m)
    - [createItem](./docs/graphql/mutations.md#create-item)
    - [editItem](./docs/graphql/mutations.md#edit-item)
    - [deleteItem](./docs/graphql/mutations.md#delete-item)

## **Contributors ✨**

Thanks go to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>

  <tr>

   <td align="center"><img src="https://avatars.githubusercontent.com/u/95321606?s=400&u=90b2d52424bfbec5411b711901d4789f2e40c470&v=4" width="100px;" alt=""/><br /><sub><b>Sherman Au (he/him)</b></sub><br /><a href="https://www.linkedin.com/in/sherman-au-2b4a69142/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13" title ="GitHub"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" width="115"></td>

   <td align="center"><img src="https://avatars.githubusercontent.com/u/93220002?s=400&u=9e2d707e1b8f15766ce240ab4272fa2fde076e87&v=4" width="100px;" alt=""/><br /><sub><b>Joseph Downs (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/josdowns/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/josephdowns" title ="GitHub"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" width="115"></td>

   <td align="center"><img src="https://avatars.githubusercontent.com/u/56653844?v=4" width="104px;" alt=""/><br /><sub><b>Phillp Kamps (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/phillip-kamps/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/phillipkamps/landing_page" title ="GitHub"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" width="115"></td>

   <td align="center"><img src="https://avatars.githubusercontent.com/u/94508708?v=4" width="100px;" alt=""/><br /><sub><b>Sandiz Thieme (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/sandisz-thieme-25335316a/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/sandisz-d734m37" title="GitHub"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" width="115"></td>

  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
