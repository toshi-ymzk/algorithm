## Matching Pairs
Given two strings __s__ and __t__ of length __N__, find the maximum number of possible matching pairs in strings __s__ and __t__ after swapping exactly two characters within __s__.

A swap is switching __s__[__i__] and __s__[__j__], where __s__[__i__] and __s__[__j__] denotes the character that is present at the **i**th and **j**th index of __s__, respectively. The matching pairs of the two strings are defined as the number of indices for which __s__[__i__] and __t__[__i__] are equal.

Note: This means you __must__ swap two characters at different indices.

#### Signature
int matchingPairs(String s, String t)

#### Input
- __s__ and t are strings of length __N__
- __N__ is between 2 and 1,000,000

#### Output
Return an integer denoting the maximum number of matching pairs

#### Example 1
__s__ = "abcd"
__t__ = "adcb"
__output__ = 4

Explanation:
Using 0-based indexing, and with i = 1 and j = 3, __s__[__1__] and __s__[__3__] can be swapped, making it  "adcb".
Therefore, the number of matching pairs of __s__ and __t__ will be 4.

#### Example 2
__s__ = "mno"
__t__ = "mno"
__output__ = 1

Explanation:
Two indices have to be swapped, regardless of which two it is, only one letter will remain the same. If i = 0 and j=1, __s__[__0__] and __s__[__1__] are swapped, making __s__ = "nmo", which shares only "o" with __t__.
