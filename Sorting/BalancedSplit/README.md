## Balanced Split

Given an array of integers (which may include repeated integers), determine if there's a way to split the array into two subsequences __A__ and __B__ such that the sum of the integers in both arrays is the same, and all of the integers in __A__ are strictly smaller than all of the integers in __B__.
Note: Strictly smaller denotes that every integer in __A__ must be less than, and not equal to, every integer in __B__.

#### Signature
bool balancedSplitExists(int[] arr)

#### Input
All integers in array are in the range [0, 1,000,000,000].

#### Output
Return true if such a split is possible, and false otherwise.

#### Example 1
arr = [1, 5, 7, 1]
output = true

We can split the array into __A__ = [1, 1, 5] and __B__ = [7].

#### Example 2
arr = [12, 7, 6, 7, 6]
output = false

We can't split the array into __A__ = [6, 6, 7] and __B__ = [7, 12] since this doesn't satisfy the requirement that all integers in __A__ are smaller than all integers in __B__.
