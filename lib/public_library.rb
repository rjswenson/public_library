

class Book
  
  attr_reader :shelf , :title

  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    @shelf = shelf
  end

  def unshelf
    @shelf = nil
  end
end


class Shelf

end
