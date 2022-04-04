## Balance Brackets
A bracket is any of the following characters: (, ), {, }, [, or ].

We consider two brackets to be __matching__ if the first bracket is an open-bracket, e.g., (, {, or [, and the second bracket is a close-bracket of the same type. That means ( and ), [ and ], and { and } are the only pairs of __matching__ brackets.

Furthermore, a sequence of brackets is said to be __balanced__ if the following conditions are met:

1. The sequence is empty, or
1. The sequence is composed of two or more non-empty sequences, all of which are __balanced__, or
1. The first and last brackets of the sequence are __matching__, and the portion of the sequence without the first and last elements is __balanced__.

You are given a string of brackets. Your task is to determine whether each sequence of brackets is balanced. If a string is balanced, return true, otherwise, return false

#### Signature
bool isBalanced(String s)

#### Input
String s with length between 1 and 1000

#### Output
A boolean representing if the string is balanced or not

#### Example 1
s = {[()]}  
output: true

#### Example 2
s = {}()  
output: true

#### Example 3
s = {(})  
output: false

#### Example 4
s = )  
output: false
