require_relative '../lib/public_library.rb'


describe 'Book(class)' do 
  it 'exists' do
    expect(Book).to be
  end
end

describe '#title within Book' do
  it 'stores a #title' do
    test_book = Book.new("bar")
    expect(test_book.title).to eq("bar")
  end
end

describe '#enshelf within Book' do
  it 'puts a book on a shelf' do
    test_book = Book.new("Magic")
    sample_shelf = Shelf.new
    test_book.enshelf(sample_shelf)
    expect(sample_shelf.books_on_shelf).to eq([test_book])
  end
end

describe '#unshelf within Book' do
  it 'removes shelf from Book properties' do
    test_book = Book.new("Sweet Book")
    sample_shelf = Shelf.new
    test_book.enshelf(sample_shelf)
    test_book.unshelf
    expect(sample_shelf.books_on_shelf).to_not include(test_book)
  end
end


describe '#enshelf' do
  it 'wont allow book to be put on multi shelves' do
    test_book = Book.new("book")
    shelf_a = Shelf.new
    shelf_b = Shelf.new
    test_book.enshelf(shelf_a)

    expect(test_book.enshelf(shelf_b)).to raise_error
  end
end

describe '#enshelfing more then one book on the same shelf' do 
  it 'shows more then one book on the shelf' do
    book_a = Book.new("Meyow")
    book_b = Book.new("Mix")
    shelf_a = Shelf.new
    book_a.enshelf(shelf_a)
    book_b.enshelf(shelf_a)
    expect(shelf_a.books_on_shelf).to eq([book_a, book_b])
  end
end
    
describe '#unshelf removes book from shelf' do
  it 'removes a book already on shelf' do
    book_a = Book.new("Test")
    shelf_a = Shelf.new
    book_a.enshelf(shelf_a)
    book_a.unshelf
    expect(shelf_a.books_on_shelf).not_to include(book_a)
  end
end

describe 'Library' do 
  it 'explicitly stores shelves' do
    lib = Library.new
    shelf_a = Shelf.new
    expect(lib.shelves(shelf_a)).to include(shelf_a)
  end
  it 'stores multiple shelves' do
    lib = Library.new
    shelf_b = Shelf.new
    shelf_a = Shelf.new
    lib.shelves(shelf_b)
    lib.shelves(shelf_a)
    expect(lib.all_shelves).to include(shelf_b, shelf_a)
  end

end


