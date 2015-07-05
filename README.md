#Running

Just run ./execute.rb and pass your input text in each line.

#Implementation

- execute.rb
Just a simple file to execute.

- input.rb
There is only a method to read a line.

- LineProcessor
It's the main class. Here we can process all lines and get the result.

- Line
Just a wrap for Pattern. To be more semantic, i've created a line class.

- Pattern
Class to hold all patterns, so, we have four patterns types.

- RomanNumbers
Class to handle RomanNumbers and convert to Arabic Numbers.



#Tests

You can find test inside the folder "test". 
I've used the Minitest 4, so I'm using MiniTest::Unit::TestCase in my class.

There are tests for:
- LineProcessor
- Pattern
- RomanNumbers

