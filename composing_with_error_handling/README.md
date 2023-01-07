
# Composing functions with separated error handling
Many times it's useful to compose chain of functions so that output of one
function is input to another function (letting data go through series of transformations as in pipeline).

Sometimes function could also validate input data (for example being certain type).
Here it's assumed that functions return **list** -value of 3 items:

1. ok (bool): true if no error, false if error happened
2. err (string): text describing error
3. actual output value

But checking of error/validation result from previous function in each function
would be complicated.

Solution to this is to wrap each function with separate function which handles:

* Checking if previously error was returned and only calling its function if no failure has happened
* Stripping ok & err -items away and giving actual value item as input to function

## bind -function
There's **bind** -function which wraps actual function with error handling function.
The **bind** -function takes actual function as argument and returns wrapper function as value.

## Running an example

Run example:

```
funla composition_with_error_handling.fnl
```

Output:

```
'
list(
        list(
                true
                ''
                map(
                        'words'
                        1
                        'some'
                        2
                        'duplicate'
                        1
                        'is'
                        2
                        'this'
                        1
                        'text'
                        1
                        'there'
                        2
                )
        )
        list(
                false
                'assuming string as input'
                ''
        )
)'
```
