## Queries
### [User Queries](#user-q)
 - [getUsers](#get-users)
  - [getAUser](#get-user)
  - [getUserItems](#get-user-items)

### [Item Queries](#item-q)
- [getItems](#get-items)
- [itemSearch](#item-search)
- [filterByCategory](#filter-by-category)
---
<br>

### <a id="user-q">User Queries</a><br>
<a id="get-users">**getUsers**</a><br>
*Will retrive all `Users` in the database*
* Example Mutation
```graph
query {
  getUsers{
    id
    name
    email
  }
}
```
* Example Response
```json
{
  "data": {
    "getUsers": [
      {
        "id": "1",
        "name": "Amada Frami",
        "email": "frami_amada@example.org"
      },
      {
        "id": "2",
        "name": "Kory Rolfson",
        "email": "rolfson.kory@example.com"
      },
      {
        "id": "3",
        "name": "Obdulia Hamill",
        "email": "hamill.obdulia@example.com"
      },
      {
        "id": "4",
        "name": "Vern Bernier",
        "email": "vern_bernier@example.net"
      },
      {
        "id": "5",
        "name": "Ms. Staci Batz",
        "email": "batz_ms_staci@example.org"
      },
      {
        "id": "6",
        "name": "Carlita Blick",
        "email": "blick.carlita@example.com"
      },
      {
        "id": "7",
        "name": "Chieko Hagenes",
        "email": "chieko_hagenes@example.org"
      }
    ]
  }
}
```
---

<br>

<a id="get-user">**getAUser**</a><br>
*Will retrive a `User` in the database*
* Example Mutation
```graph
query {
  getAUser(
    email: "frami_amada@example.org"
  ) {
    id
    name
    email
  }
}
```
* Example Response
```json
{
  "data": {
    "getAUser": {
      "id": "1",
      "name": "Amada Frami",
      "email": "frami_amada@example.org"
    }
  }
}
```
---
<br>

<a id="get-user-items">**getUserItems**</a><br>
*Will retrive a `User` and their assoicated `items` in the database*
* Example Mutation
```graph
query {
  getUserItems(
    id:"1"
  ) {
    id
    name
    description
    available
    category
    status
  }
}
```
* Example Response
```json
{
  "data": {
    "getUserItems": [
      {
        "id": "1",
        "name": "Judgmental-copper Sleek Plastic Wallet",
        "description": "Actually shabby chic marfa phlogiston banh mi swag lomo slow-carb.",
        "available": "true",
        "category": "Scrapbook/Floral",
        "status": "Borrow"
      },
      {
        "id": "2",
        "name": "Lackluster-indigo Sleek Leather Keyboard",
        "description": "Crucifix craft beer photo booth next level.",
        "available": "false",
        "category": "Painting",
        "status": "Trade"
      },
      {
        "id": "3",
        "name": "Serious-cerulean Fantastic Silk Coat",
        "description": "Schlitz vice etsy mixtape.",
        "available": "true",
        "category": "Wood Working",
        "status": "Give"
      },
      {
        "id": "4",
        "name": "Relieved-lime Intelligent Plastic Clock",
        "description": "Yolo drinking blue bottle mlkshk.",
        "available": "true",
        "category": "Wood Working",
        "status": "Borrow"
      },
      {
        "id": "5",
        "name": "Inquisitive-puce Small Leather Bottle",
        "description": "Distillery 90's celiac vice raw denim gentrify pop-up.",
        "available": "false",
        "category": "Scrapbook/Floral",
        "status": "Give"
      }
    ]
  }
}
```
---
<br>


### <a id="item-q">Item Queries</a><br>
<a id="get-items">**getItems**</a><br>
*Will retrive all `Items` along with the `User` attributes in the database*
* Example Mutation
```graph
query {
  getItems{
    id
    name
    description
    available
    category
    status
  }
}
```
* Example Response
```json
{
  "data": {
    "getItems": [
      {
        "id": "1",
        "name": "Judgmental-copper Sleek Plastic Wallet",
        "description": "Actually shabby chic marfa phlogiston banh mi swag lomo slow-carb.",
        "available": "true",
        "category": "Scrapbook/Floral",
        "status": "Borrow",
        "user": {
          "id": "1",
          "name": "Amada Frami",
          "email": "frami_amada@example.org"
        }
      },
      {
        "id": "2",
        "name": "Lackluster-indigo Sleek Leather Keyboard",
        "description": "Crucifix craft beer photo booth next level.",
        "available": "false",
        "category": "Painting",
        "status": "Trade",
        "user": {
          "id": "1",
          "name": "Amada Frami",
          "email": "frami_amada@example.org"
        }
      },
      {
        "id": "3",
        "name": "Serious-cerulean Fantastic Silk Coat",
        "description": "Schlitz vice etsy mixtape.",
        "available": "true",
        "category": "Wood Working",
        "status": "Give",
        "user": {
          "id": "1",
          "name": "Amada Frami",
          "email": "frami_amada@example.org"
        }
      },
      {
        "id": "4",
        "name": "Relieved-lime Intelligent Plastic Clock",
        "description": "Yolo drinking blue bottle mlkshk.",
        "available": "true",
        "category": "Wood Working",
        "status": "Borrow",
        "user": {
          "id": "1",
          "name": "Amada Frami",
          "email": "frami_amada@example.org"
        }
      },
      {
        "id": "5",
        "name": "Inquisitive-puce Small Leather Bottle",
        "description": "Distillery 90's celiac vice raw denim gentrify pop-up.",
        "available": "false",
        "category": "Scrapbook/Floral",
        "status": "Give",
        "user": {
          "id": "1",
          "name": "Amada Frami",
          "email": "frami_amada@example.org"
        }
      },
      {
        "id": "6",
        "name": "Preoccupied-white Durable Marble Lamp",
        "description": "Banh mi you probably haven't heard of them etsy chillwave hella viral meditation.",
        "available": "true",
        "category": "Sewing/Knitting",
        "status": "Borrow",
        "user": {
          "id": "2",
          "name": "Kory Rolfson",
          "email": "rolfson.kory@example.com"
        }
      },
      {
        "id": "7",
        "name": "Perturbed-indigo Awesome Leather Keyboard",
        "description": "Literally five dollar toast heirloom letterpress.",
        "available": "false",
        "category": "Sewing/Knitting",
        "status": "Borrow",
        "user": {
          "id": "2",
          "name": "Kory Rolfson",
          "email": "rolfson.kory@example.com"
        }
      },
      {
        "id": "8",
        "name": "Wronged-ruby Mediocre Aluminum Keyboard",
        "description": "Kinfolk freegan hoodie keffiyeh iphone wolf tumblr xoxo.",
        "available": "false",
        "category": "Wood Working",
        "status": "Give",
        "user": {
          "id": "2",
          "name": "Kory Rolfson",
          "email": "rolfson.kory@example.com"
        }
      },
      {
        "id": "9",
        "name": "Moody-erin Intelligent Wool Watch",
        "description": "+1 waistcoat ennui carry pork belly actually.",
        "available": "true",
        "category": "Scrapbook/Floral",
        "status": "Trade",
        "user": {
          "id": "2",
          "name": "Kory Rolfson",
          "email": "rolfson.kory@example.com"
        }
      },
      {
        "id": "10",
        "name": "Amazed-black Rustic Bronze Shoes",
        "description": "Scenester muggle magic mumblecore shabby chic bespoke sartorial umami.",
        "available": "false",
        "category": "Scrapbook/Floral",
        "status": "Trade",
        "user": {
          "id": "2",
          "name": "Kory Rolfson",
          "email": "rolfson.kory@example.com"
        }
      },
      {
        "id": "11",
        "name": "Outraged-blue Heavy Duty Wool Bag",
        "description": "Quinoa poutine bushwick waistcoat disrupt vice messenger bag.",
        "available": "true",
        "category": "Painting",
        "status": "Give",
        "user": {
          "id": "3",
          "name": "Obdulia Hamill",
          "email": "hamill.obdulia@example.com"
        }
      },
      {
        "id": "12",
        "name": "Grateful-peach Small Marble Coat",
        "description": "Gluten-free authentic microdosing thundercats +1 normcore poutine carry pour-over.",
        "available": "true",
        "category": "Wood Working",
        "status": "Borrow",
        "user": {
          "id": "3",
          "name": "Obdulia Hamill",
          "email": "hamill.obdulia@example.com"
        }
      },
      {
        "id": "13",
        "name": "Awed-violet Ergonomic Paper Table",
        "description": "Ugh direct trade muggle magic xoxo vinyl church-key.",
        "available": "false",
        "category": "Baking",
        "status": "Trade",
        "user": {
          "id": "3",
          "name": "Obdulia Hamill",
          "email": "hamill.obdulia@example.com"
        }
      },
      {
        "id": "14",
        "name": "Cantankerous-indigo Aerodynamic Paper Coat",
        "description": "Fanny pack wolf crucifix keffiyeh.",
        "available": "false",
        "category": "Scrapbook/Floral",
        "status": "Trade",
        "user": {
          "id": "3",
          "name": "Obdulia Hamill",
          "email": "hamill.obdulia@example.com"
        }
      }
```
---
<br>

<a id="item-search">**itemSearch**</a><br>
*Will retrive all `Items` along with the `User` attributes in the database based on a partial search in the description*
* Example Mutation
```graph
query {
	 itemSearch(keyword: "blue"){
    id
    name
    description
    category
    available
    amount
    status
    user{
      name
      email
    }
  }
}
```
* Example Response
```json
{
  "data": {
    "itemSearch": [
      {
        "id": "11",
        "name": "Outraged-blue Heavy Duty Wool Bag",
        "description": "Quinoa poutine bushwick waistcoat disrupt vice messenger bag.",
        "category": "Painting",
        "available": "true",
        "amount": 2,
        "status": "Give",
        "user": {
          "name": "Obdulia Hamill",
          "email": "hamill.obdulia@example.com"
        }
      },
      {
        "id": "26",
        "name": "Disdainful-blue Aerodynamic Plastic Pants",
        "description": "Gentrify asymmetrical hammock cronut viral keffiyeh.",
        "category": "Other",
        "available": "false",
        "amount": 3,
        "status": "Borrow",
        "user": {
          "name": "Carlita Blick",
          "email": "blick.carlita@example.com"
        }
      }
    ]
  }
}
```
---
<br>

<a id="filter-by-category">**filterByCategory**</a><br>
*Will retrive all `Items` along with the `User` attributes in the database based on a partial search in the description*
* Example Mutation
```graph
query {
  filterByCategory(keyword: "Sewing/Knitting")
  {
    id
    name
    description
    available
    category
    status
  }
}
```
* Example Response
```json
{
  "data": {
    "filterByCategory": [
      {
        "id": "6",
        "name": "Preoccupied-white Durable Marble Lamp",
        "description": "Banh mi you probably haven't heard of them etsy chillwave hella viral meditation.",
        "available": "true",
        "category": "Sewing/Knitting",
        "status": "Borrow"
      },
      {
        "id": "7",
        "name": "Perturbed-indigo Awesome Leather Keyboard",
        "description": "Literally five dollar toast heirloom letterpress.",
        "available": "false",
        "category": "Sewing/Knitting",
        "status": "Borrow"
      },
      {
        "id": "30",
        "name": "Tolerated-bronze Mediocre Aluminum Clock",
        "description": "Sartorial vinegar cold-pressed migas.",
        "available": "true",
        "category": "Sewing/Knitting",
        "status": "Trade"
      },
      {
        "id": "33",
        "name": "Content-copper Awesome Bronze Watch",
        "description": "Xoxo craft beer locavore mustache bicycle rights.",
        "available": "true",
        "category": "Sewing/Knitting",
        "status": "Give"
      },
      {
        "id": "40",
        "name": "Misunderstood-jade Enormous Aluminum Keyboard",
        "description": "Vhs authentic brunch flexitarian roof ennui fingerstache slow-carb migas.",
        "available": "false",
        "category": "Sewing/Knitting",
        "status": "Trade"
      },
      {
        "id": "45",
        "name": "Affable-ochre Incredible Linen Car",
        "description": "Church-key chambray street readymade godard.",
        "available": "false",
        "category": "Sewing/Knitting",
        "status": "Give"
      }
    ]
  }
}
```
---
<br>
