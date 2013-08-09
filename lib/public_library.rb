class Book
  attr_reader :title 
  
  def initialize(title, library)
    @title = title
    @library = library
    @library.unshelved(@title, true)

  end

  def enshelf(shelf)
    if shelf.books == nil || shelf.books.include?(self) == false      #attaches a book to a shelf if not already done so
      @shelf = shelf
      shelf.add_book(self)     #adds instance of Book (ie self) to the shelf class instance passed in as an argument
      @library.unshelved(@title, false)
    else
      raise "The book is already on a shelf!"      #raises exception if book is already on a shelf
    end
  end

  def unshelf
    if @shelf.books != nil && @shelf.books.include?(self) == true     #removes book if it is indeed on a shelf
      @shelf.remove_book(self)
      @library.unshelved(@title, true)
    else
      raise "That book is not on a shelf!"
    end      
  end
end


class Shelf
  attr_reader :books   #allows us to see what books are on a particular class instance of Shelf

  def initialize (library)
    library.add_shelf(self)   #as shelf is initialized, it adds itself to the shelves within the library of which it is a member
    @books = []
  end

  def remove_book(book)
    @books.delete(book)
  end

  def add_book(book)
    @books.push(book) 
  end
end


class Library
  attr_reader :shelves
  
  def initialize
    @shelves = []
    @all_books = []
    @unshelved_books = []
    @shelved_books = []
  end

  def add_shelf(shelf)           #this method is actually run by an instance of class Shelf, to push into the Library instance
    @shelves.push(shelf)
  end

  def shelved
    @shelves.each do |x|                                   #for each shelf
      x.books.each do |y|                                  #examine each book on said shelf
        @shelved_books = @shelved_books.push(y.title)      #and push its title to the @all_books array
      end
    end
    @shelved_books
  end
  
  def unshelved(book, bool)                                #called by instance of class Book
    @unshelved_books.push(book) if bool == true            #keeps track of books removed from shelves
    @unshelved_books.delete(book) if bool == false
  end

  def all_books
   @all_books = @shelved_books | @unshelved_books          #adds all the books together
   @all_books.flatten.sort                                 #sorts alphabetically
  end
end