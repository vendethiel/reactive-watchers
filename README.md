Reactive Watchers
=================

Bindings generator for [Reactive](https://github.com/component/reactive) and [Model](github.com/component/model)/[Modella](https://github.com/modella/modella).

### Install

```
$ component install Nami-Doc/reactive-watchers
```

### Usage

```livescript
model = require 'modella'
model-list = require './my-model-list'

# Create the model with modella
User = model 'User'
  .attr '_id'
  .attr 'name'
  .attr 'address'

# create watchers for fields
react = new reactive-watchers new-model, <[ name address ]>

# create a model to hold the form fields value
new-model = new User

view = reactive el, models,
  delegate:
    # generate delegates ("updateField")
    react.generate! with
      add-model: !->
        # ... do your validations
        # push model to list (reactive will update the view)
        list-models.push new-model
        # override `reactive-watchers`'s `model` with a clean one
        react.model = new-model := new User
```

With the corresponding HTML :

```html
<form on-submit="addModel">
  <fieldset>
    <legend>Add a user</legend>
    <input name="name" placeholder="Name" on-change="updateName" />
    <input name="address" placeholder="Address" on-change="updateAddress" />
    <input type="submit" />
  </fieldset>
</form>
```

Or if you like Jade better :

```jade
form(on-submit="addModel")
  fieldset
    legend Add a user
    input(name="name" placeholder="Name" on-change="updateName")
    input(name="address" placeholder="Address" on-change="updateAddress")
    input(type="submit")
```