Public Library Class Design
---------------------------

Classes: Library - Shelf - Book




(1) Use object-oriented Ruby to model a public library (w/ three classes: Library, Shelf, & Book). 
The library should be aware of a number of shelves. Each shelf should know what books it contains. 
Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on. 
The library should have a method to report all books it contains. 
Note: this should *not* be a Rails app - just a single file with three classes 
(plus commands at the bottom showing it works) is all that is needed. 


a.  Library is aware of shelves: class Library, method add_shelf.  Each library can call 
    its shelves with 'library.shelves'

b.  Each shelf knows what books it contains:  class Book, method enshelf.  Runs 'Shelf'
    add_book method with argument of (self), therefore adding that instance of book to
    that instance of shelf.  We can output this knowledge with 'shelf.books'

c.  Library can reports all of its books:  Library 'shelved' method searches each shelf for  
    books, 'unshelved' keeps track of unshelved books, and they are added together into an array via method 'all books'

d.  Rspec /Spec provided to see extended functionality
    