## What was changed:
Feat:
- `mutation_type.rb`
  - `#create_item field`
  - `#edit_item field`
  - `#delete_item field`<br>

Refactor:
- `item_type.rb`
- `getItems_request_spec.rb`

Test:
- `createItem_request_spec.rb`

## Explain the reason for changes: (If there is no spec file how were things tested)
Front End requested for `User name` to show up along with any item query.

Visually tested the other mutation requests but writing spec tests for the rest of the `Item Mutations` after this PR


## Link to issue: (Delete if no issue)