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
    test_book.unshelf
    expect(test_book.shelf).to eq(nil)
  end
end


describe '#enshelf' do
  it 'wont allow book to be put on multi shelves' do
    test_book = Book.new("book")
    shelf_a = Shelf.new
    shelf_b = Shelf.new
    test_book.enshelf(shelf_a)
    expect(test_book.enshelf(shelf_b)).to eq("The book is already on a shelf!")
  end
end

    

