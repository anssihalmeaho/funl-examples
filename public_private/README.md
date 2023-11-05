
# Public and private visibility in module
In many programming languages there's support for defining **public** parts (visible to module users) and **private** parts (visible only inside the module) of module.
**FunL** doesn't support these kind of separation at syntax level but it provides mean to achieve same by other means.

This example shows how module (**words.fnl**) can have several public functions and also several functions which are only visible for public functions implementations.

Public functions in **words.fnl** are:

* word-count
* word-list
* word-frequencies

Private functions are:

* remove-special-chars
* pre-process-input-string
* make-word-list

Example contains two parts:

1. main program: **public_private.fnl**
2. module (_words_): **words.fnl**

## Running the example

Run example:

```
funla public_private.fnl
```

Output:

```
'
11
list('this', 'is', 'just', 'some', 'example', 'text', 'it', 'is', 'just', 'for', 'example')
map('it' : 1, 'example' : 2, 'some' : 1, 'is' : 2, 'this' : 1, 'just' : 2, 'text' : 1, 'for' : 1)
'
```

