

class Book
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    @shelf = shelf
  end

  def shelf
    @shelf
  end
end


class Shelf

end
