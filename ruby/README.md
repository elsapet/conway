# Conway's Game of Life (Ruby Edition)

A Ruby version of Conway's Game of Life for the console.

```ruby
. . . . o o o o . . . . . . . . . . . . . . . . .
. o o . o o . . o o . . . . . . . o o o o . . o o
. . . . . . . . . o . . . o o . . . o o . . . o .
. . . . . . o . o . . o . . . . o . . . o o o . o
. . . . . o o . o . . o . o . . o . . . . o o o .
. . . . . . o . . o . o . . o o o . . . . . . . .
. . . . . . . o o o o o . . o . . . . . . . . . .
. . . . . . . . o . . . o o . . . o o . o . . . .
. . . . . . . . . . . . o . . . . o o . o . . . .
. . . . . . . . . . . . . . . o o o . . . o o . .
. . . . . o . . . . . . . . o . o . . . . . o o .
. . . . o . o . . . . . . . . . o o . . . . . . o
. . . . o . o . . . . . . . . . . . . . . o . o .
. o . . . o . . . . . . o o . o . . . . o . . . .
o . o . . . . . . . o o . . o o . . . . . o . o .
o . . o . . . . . o . o . . . . o . . . . . . . .
. o o . . . . o . o . . o o . o . . . . . . . o o
. . . . . . . o . o o . o . . o . . . . o . . . .
. . . . . . . o . . . . o o o o o o . . o . . . .
. . . . . . . . o o o . . o . o o o . . . . . . .
. o . . . . . o . . o . o o . o o . . . . . . . .
o . . . . . . . o o . . . . o . . . o . . o . . .
o . . . . . . . . . o . . . . . . . o o o . . . .
o o . . . o . . . o o . . . . . o . o . . . . o o
. . . . . o . o o . . . . . . . o o . . . . . o o
```

## Design

The World contains many Cells, each with a state (dead or alive). Given its neighbours, a Cell knows its state for the next generation of the World.

## How To Play

Step 1: Load the game

Run the following shell script to load the game into an irb

```bash
bin/play.sh
```

Step 2: Play!

Either begin with a pseudo random world, like so

```ruby
Conway.play
```

Or give the initial world as a two-dimensional Boolean array, like this

```ruby
Conway.play([[false, false, false],[true, true, true],[false, false, false]])
```

(Play is infinite, so use `Ctrl-C` to exit)

## Tests

Make sure RSpec is installed

```ruby
gem install rspec
```

Run the full test suite with

```ruby
rspec
```
