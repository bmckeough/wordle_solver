# WordleSolver

A very simplistinc tool for solving [Wordle](https://www.powerlanguage.co.uk/wordle/). For a more sophisticated take on this problem, please see [3Blue1Brown's "Best opener: CRANE"](https://www.3blue1brown.com/lessons/wordle).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wordle_solver'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wordle_solver

## Usage

```
bin/console
p = WordleSolver::Puzzle.new
p.recommend_guess
# Identity the three parameters to #filter
# positional: {letter => index} for green letters
# non_positional: {letter => index} for yellow letters
# unmatched: [letter] for grey letters
p.filter({positional, non_positional, unmatched)
p.recommend_guess
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This repository is not under active development and is not supported. You are welcome to fork it and continue development and support.
