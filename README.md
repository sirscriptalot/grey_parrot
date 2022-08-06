# GreyParrot

GreyParrot is a small library used to match and store values. It can be useful for defining
"values" that can be set once, parsing data, and more.

GreyParrot behaves somewhat like Ruby's built in pattern matching except that the GreyParrot instance itself does not change on match, allowing us to pass it around like a pointer.

The name of the library is comes from the [grey parrot](https://en.wikipedia.org/wiki/Grey_parrot), a fascinating bird capable of "matching" sounds and "storing" hundreds of them in its memory.

## Install

GreyParrot is available via RubyGems.org and can be installed via the command line with:

`gem install grey_parrot`

## Usage

```ruby
  alex = GreyParrot.new

  # When no value is given to `GreyParrot.new`, the default value will always
  # match and the given value stored.
  alex.match(String) # => true
  alex.value # => String

  # Any given value that matches the current value via `#===` will be stored.
  alex.match("Hello") # => true
  alex.value # => "Hello"

  # When the value does not match, we return false and do not store the value.
  alex.match("Goodbye") # => false
  alex.value # => "Hello"
```

* `#value` - Reads the current value.

* `#value=` - Writes the current value without matching.

* `#match(other)` - If the the given value matches the current value via `#===`, stores the given value and returns true. Returns false when the given value does not match the current value.

* `#match!(other)` - Same as `#match` but will raise `GreyParrot::MatchError` when the given value does not match the current value.
