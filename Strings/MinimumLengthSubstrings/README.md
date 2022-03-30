## Minimum Length Substrings
You are given two strings __s__ and __t__. You can select any substring of string __s__ and rearrange the characters of the selected substring. Determine the minimum length of the substring of __s__ such that string __t__ is a substring of the selected substring.

#### Signature
int minLengthSubstring(String s, String t)

#### Input
__s__ and __t__ are non-empty strings that contain less than 1,000,000 characters each

#### Output
Return the minimum length of the substring of __s__. If it is not possible, return -1

#### Example
__s__ = "dcbefebce"
__t__ = "fd"
__output__ = 5

Explanation:
Substring "dcbef" can be rearranged to "cfdeb", "cefdb", and so on. String t is a substring of "cfdeb". Thus, the minimum length required is 5.
