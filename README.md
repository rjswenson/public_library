##### The Public Library #####

--## Welcome ##--

This project includes: Ruby

Spec:

   (1) Use object-oriented Ruby to model a public library (w/ three classes: Library, Shelf, & Book). 
   The library should be aware of a number of shelves. Each shelf should know what books it contains. 
   Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on. 
   The library should have a method to report all books it contains. 
   Note: this should *not* be a Rails app - just a single file with three classes 
   (plus commands at the bottom showing it works) is all that is needed. 

Functionality:

   + One file, 3 classes : Book / Shelf / Library
   
   + When books are created, they instantly enter the library as
     an unshelved book (Class Book, #initialize library.unshelved)
   
   + enshelf and unshelf methods, which add the instance of book to 
     either shelf @books array or the library @unshelved array
   
   + Class Library, #all_books returns all books in the library
   
   + Each Class Shelf instance knows which books it contains via
     @books
   
   + When a Shelf instance is initialized, it automatically adds the
     shelf to the library it is called

   + Spec file attached that shows interations and validity


Commands:

  lib = Library.new
  a_to_g = Shelf.new(lib)      <- in library 'lib'
  book_a = Book.new("Allibaster", lib)   <- book in 'lib' 
  book_a.enshelf(a_to_g)       <- book now on shelf

  lib.shelves -> [a_to_g]
  lib.all_books -> [book_a]
  a_to_g.books -> [book_a]

    