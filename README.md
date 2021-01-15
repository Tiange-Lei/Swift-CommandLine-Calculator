# Swift-CommandLine-Calculator
A macOS command-line tool that will act as a simple calculator. The calculator will be run from the command line and will only work with integer numbers and the following arithmetic operators: `+` `-` `x` `/` `%`. The `%` operator is the modulus operator, not percentage.

For example, if the program is compiled to `calc`, the following demonstrates how it will work

    ./calc 3 + 5 - 7
    1

In the command line, the arguments are a repeated sequence in the form

    number operator

and ending in a

    number

Hitting the enter key will cause the program to evaluate the arguments and print the result.
