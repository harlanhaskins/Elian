README for Elian
================


This is a very basic app, and it's nowhere near finished. I'm releasing this code to you all on GitHub, because I love Open Source.

How the letter recognition works
--------------------------------

The buttons placed on the main screen are to be read as a one-byte binary sequence, left-right-up-down, with the top rectangle being the first number in the sequence and the dot being the last digit.

For example, the letter a can be expressed like this (='s being 1's and -'s being 0's):

	 =====
	
	|  -  ||
	
	 -----
	
	|     |
	
	 -----

with a binary representation of 10100000.

And y can be expressed with this:

	 =====
	
	|| =  |

	 -----

	||    |
	
	 -----

with a binary representation of 11001001.

There's a plist in the source called ElianLetters.plist. In it, there are 26 dictionaries, each with a letter for a lowercase key. Each of those keys has one to four binary letter representations. I just figured them out manually. Whatever.

The code compares the current letter code (determined by concatenating the tags of the buttons in order) with the strings in each of the 26 dictionaries. Then it shows the letter overhead. The user can use the buttons provided to shift, add spaces, delete the last letter, clear the text, reset the buttons and enter the letter.
