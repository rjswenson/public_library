class Book
  attr_reader :title 
  
  def initialize(title, library)
    @title = title
    @library = library
    @library.unshelved(self, true)

  end

  def enshelf(shelf)
    if @library.unshelved_books.include?(self) == true      #attaches a book to a shelf if not already done so
      @shelf = shelf
      shelf.add_book(self)     #adds instance of Book (ie self) to the shelf class instance passed in as an argument
      @library.unshelved(self, false)
    else
      raise "The book is already on a shelf!"      #raises exception if book is already on a shelf
    end
  end

  def unshelf
    if @library.unshelved_books.include?(self) == false     #removes book if it is indeed on a shelf
      @shelf.remove_book(self)
      @library.unshelved(self, true)
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
  attr_reader :shelves, :unshelved_books
  
  def initialize
    @shelves = []
    @unshelved_books = []
    @shelved_books = []
  end

  def add_shelf(shelf)           #this method is actually run by an instance of class Shelf, to push into the Library instance
    @shelves.push(shelf)
  end

  def shelved
    @shelves.each do |shlf|                                   #for each shelf
      shlf.books.each do |bk|                                  #examine each book on said shelf
        @shelved_books.push(bk)      #and push its title to the @all_books array
      end
    end
    @shelved_books
  end
  
  def unshelved(book, bool)                                #called by instance of class Book
    @unshelved_books.push(book) if bool == true            #keeps track of books removed from shelves
    @unshelved_books.delete(book) if bool == false
  end

  def all_books
   @shelved_books + @unshelved_books                     #adds all the books together
  end
end