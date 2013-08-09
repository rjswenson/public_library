

class Book
  
  attr_reader :shelf , :title
  @@shelf_counter = 0
  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    @@shelf_counter += 1
    if @@shelf_counter > 1
      "The book is already on a shelf!"
    else
      shelf.add_book(self)
    end
  end

  def unshelf
    @shelf = nil
  end
end


class Shelf
  attr_reader :books_on_shelf

  def initialize
  
  end

  def add_book(book)
    @books_on_shelf = [book]
  end
end
