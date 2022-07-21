## Mutations
### [User Mutations](#user)
- [createUser](#create-user)
- [editUser](#edit-user)
- [deleteUser](#delete-user)

### [Item Mutations](#item)
- [createItem](#create-item)
- [editItem](#edit-item)
- [deleteItem](#delete-item)
---

<br>

### <a id="user">User Mutations</a><br>
<a id="create-user">**createUser**</a><br>
*Used during profile creation. Will create a new user in the database*
* Example Mutation
```graph
mutation {
  createUser(
    input: {
      name: "Test",
      email: "test@test.test"
      }
      ) {
        user {
          id
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
    "createUser": {
      "user": {
        "id": "11",
        "name": "Test",
        "email": "test@test.test"
      }
    }
  }
}
```
---

<br>

<a id="edit-user">**editUser**</a><br>
* Will allow a user in the database*
* Example Mutation
```graph
mutation {
  editUser(
    input: {
      id: "11"
      name: "Example",
      email: "test@test.test"
      }
      ) {
        user {
          id
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
    "editUser": {
      "user": {
        "id": "11",
        "name": "Example",
        "email": "test@test.test"
      }
    }
  }
}
```
---

<br>

<a id="delete-user">**deleteUser**</a><br>
* Will delete a user in the database*
* Example Mutation
```graph
mutation {
  deleteUser(
    input: {
      id: "11"
      }
      ) {
        success
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "deleteUser": {
      "success": {
       true
      }
    }
  }
}
```
---

<br>

### <a id="item">Item Mutations</a>
<a id="create-item">**createItem**</a><br>
*Used during item creation. Will create a new item attached to a User in the database*
* Example Mutation
```graph
mutation {
  createItem(
    input: {
      userId: "#{@bojack.id}"
      name: "Magical Chisels",
      category: 7,
      description: "They're magical!",
      available: 1,
      amount: 9,
      status: 0
      }
      ) {
        item {
          id
          name
          category
          description
          available
          amount
          status
          user {
            id
            name
          }
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "createItem": {
      "item": {
        "id": "51",
        "name": "Magical Chisels",
        "description": "a test item",
        "category": "Sewing/Knitting",
        "available": "true",
        "status": "Give",
        "amount": 9,
        "user": {
          "id": "1",
          "name": "Oren Renner",
          "email": "renner.oren@example.org"
        }
      }
    }
  }
}

```
---

<br>
