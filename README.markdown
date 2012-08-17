README for Elian
================


This is a very basic app, and it's nowhere near finished. I'm releasing this code to you all on GitHub, because I love Open Source.
	
Oh, and so we get this out of the way:

	Copyright (C) 2012  Harlan Haskins

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

How the letter recognition works
--------------------------------

The buttons placed on the main screen are to be read as a one-byte binary sequence, left-right-up-down, with the top rectangle being the first number in the sequence and the dot being the last digit.

For example, the letter a can be expressed like this (='s being 1's and -'s being 0's):

	 =====
	
	|| -  =
	
	 -----
	
	||    |
	
	 -----

with a binary representation of 10100000.

And y can be expressed with this:

	 =====
	
	|| =  |

	 -----

	||    |
	
	 -----

with a binary representation of 110010010.

There's a plist in the source called ElianLetters.plist. In it, there are 26 dictionaries, each with a letter for a lowercase key. Each of those keys has one to four binary letter representations. I just figured them out manually. Whatever.

The code compares the current letter code (determined by concatenating the tags of the buttons in order) with the strings in each of the 26 dictionaries. Then it shows the letter overhead. The user can use the buttons provided to shift, add spaces, delete the last letter, clear the text, reset the buttons and enter the letter.
