

class Book
  
  attr_reader :title 
  
  
  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    if shelf.books_on_shelf == nil || shelf.books_on_shelf.include?(self) == false
      @shelf = shelf
      shelf.add_book(self)
    else
      raise "The book is already on a shelf!"
    end
  end

  def unshelf
    if @shelf.books_on_shelf != nil && @shelf.books_on_shelf.include?(self) == true
      @shelf.remove_book(self)
    else
      raise "That book is not on a shelf!"
    end      
  end
end


class Shelf
  attr_reader :books_on_shelf

  def initialize
  end

  def remove_book(book)
    @books_on_shelf.delete(book)
  end

  def add_book(book)
    @books_on_shelf = [] if !@books_on_shelf
    @books_on_shelf.push(book) 

  end
end




class Library
  attr_reader :all_shelves
  
  def initialize
  
  end

  def shelves(shelf) 
    @all_shelves = [] if !@all_shelves
    @all_shelves.push(shelf)
  end


end
















