Vermic
======

Command line utility for publishing your code on pastebin.com
Current version - 0.1.2

I often ask questions on irc and forums. So, I had to paste my code into public accessible places such as pastebin.com. This process was pretty much boring - you go to the text editor, you copy everything, you go to the website, you paste it. 
I've decided to create a little utility to make this process easier. 
Now it copies the url of the paste to the system clipboard using the clipboard gem.

As soon as this is my first gem please let me know if you notice some ugly code or architecture. 

TODO:

1. + Handle missing mandatory arguments 
2. + Copy URL to the system clipboard(tested for linux only)
3. Add file extension recognizer

Why?
----

This gem is quite useless because it cannot be used by many people since there's a restriction for pastes from one developer API a day. However, even from this simple project I've learned a lot of things and this is the first gem I've ever created, yupi. 
I feel that there're tons of design and other trivial errors here so if you can admit any mistakes here please let me know.

Why vermic?
-----------

Well, we all know about spaghetti code. Let me give you my association row:

pastebin.com -> a lot of code -> huh, a lot of spaghetti code -> Italian cuisine -> vermicelli??? -> vermic
