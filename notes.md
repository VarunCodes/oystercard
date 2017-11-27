# Notes

### Challenge \#3 Debugging with RSpec

RSpec error message:
*NameError: uninitialized constant Oystercard
./spec/oystercard_spec.rb:1:in `<top (required)>'*

1) Write down the type of error in the issue comments
NameError: uninitialized constant

2) Write down the file path where the error happened
./oystercard/spec/oystercard_spec

3) Write down the line number of the error
Line 1

4) Use the Ruby Documentation to find out what the error means
The NameError is raised when a given name is invalid or undefined.
In this case 'Oystercard' class doesn't exist (yet).

5) Suggest one way of solving the error
Create a class called 'Oystercard' in a /lib folder titled 'oystercard.rb'
