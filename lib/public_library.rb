

class Book
  attr_reader :title 
  
  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    if shelf.books_on_shelf == nil || shelf.books_on_shelf.include?(self) == false      #attaches a book to a shelf if not already done so
      @shelf = shelf
      shelf.add_book(self)     #adds instance of Book (ie self) to the shelf class instance passed in as an argument
    else
      raise "The book is already on a shelf!"      #raises exception if book is already on a shelf
    end
  end

  def unshelf
    if @shelf.books_on_shelf != nil && @shelf.books_on_shelf.include?(self) == true     #removes book if it is indeed on a shelf
      @shelf.remove_book(self)
    else
      raise "That book is not on a shelf!"
    end      
  end
end


class Shelf
  attr_reader :books_on_shelf   #allows us to see what books are on a particular class instance of Shelf

  def initialize (library)
    library.add_shelf(self)   #as shelf is initialized, it adds itself to the shelves within the library of which it is a member
    @books_on_shelf = []
  end

  def remove_book(book)
    @books_on_shelf.delete(book)
  end

  def add_book(book)
    @books_on_shelf.push(book) 
  end
end


class Library
  attr_reader :all_shelves
  
  def initialize
    @all_shelves = []
    @all_books = []
  end

  def add_shelf(shelf)           #this method is actually run by an instance of class Shelf, to push into the Library instance
    @all_shelves.push(shelf)
  end

  def all_books
    @all_shelves.each do |x|              #for each shelf
      x.books_on_shelf.each do |y|        #examine each book on said shelf
        @all_books.push(y.title)          #and push its title to the @all_books array
      end
    end
    
    @all_books
  end
end
















