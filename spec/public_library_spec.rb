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
    library_ex = Library.new
    sample_shelf = Shelf.new(library_ex)
    test_book.enshelf(sample_shelf)
    expect(sample_shelf.books_on_shelf).to eq([test_book])
  end
end

describe '#unshelf within Book' do
  it 'removes shelf from Book properties' do
    test_book = Book.new("Sweet Book")
    library_ex = Library.new
    sample_shelf = Shelf.new(library_ex)
    test_book.enshelf(sample_shelf)
    test_book.unshelf
    expect(sample_shelf.books_on_shelf).to_not include(test_book)
  end
end


describe '#enshelf' do
  it 'wont allow book to be put on multi shelves' do
    test_book = Book.new("book")
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    shelf_b = Shelf.new(library_ex)
    test_book.enshelf(shelf_a)

    expect(test_book.enshelf(shelf_b)).to raise_error
  end
end

describe '#enshelfing more then one book on the same shelf' do 
  it 'shows more then one book on the shelf' do
    book_a = Book.new("Meyow")
    book_b = Book.new("Mix")
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    book_a.enshelf(shelf_a)
    book_b.enshelf(shelf_a)
    expect(shelf_a.books_on_shelf).to eq([book_a, book_b])
  end
end
    
describe '#unshelf removes book from shelf' do
  it 'removes a book already on shelf' do
    book_a = Book.new("Test")
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    book_a.enshelf(shelf_a)
    book_a.unshelf
    expect(shelf_a.books_on_shelf).not_to include(book_a)
  end

  it 'removes a book from a shelf, after others have been added' do
    book_a = Book.new("Test")
    book_b = Book.new("Spongebob")
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    book_a.enshelf(shelf_a)
    book_b.enshelf(shelf_a)
    book_a.unshelf
    expect(shelf_a.books_on_shelf).not_to include(book_a)
  end

  it 'can handle multiple shelf changes' do
    book_a = Book.new("Test")
    book_b = Book.new("Spongebob")
    book_c = Book.new("Something")
    book_d = Book.new("Game of Thrones")
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)

    book_a.enshelf(shelf_a)
    book_b.enshelf(shelf_a)
    book_a.unshelf
    book_c.enshelf(shelf_a)
    book_a.enshelf(shelf_a)
    book_b.unshelf
    book_d.enshelf(shelf_a)
    expect(shelf_a.books_on_shelf).to include(book_a, book_c, book_d)
    expect(shelf_a.books_on_shelf).to_not include(book_b)
  end
end

describe 'Library' do 
  it 'explicitly stores shelves' do
    lib = Library.new
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    expect(lib.add_shelf(shelf_a)).to include(shelf_a)
  end
  it 'stores multiple shelves' do
    library_ex = Library.new
    shelf_b = Shelf.new(library_ex)
    shelf_a = Shelf.new(library_ex)
    expect(library_ex.all_shelves).to include(shelf_b, shelf_a)
  end
  it 'displays all the shelves' do
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    shelf_b = Shelf.new(library_ex)
    shelf_c = Shelf.new(library_ex)
  end

  it 'displays all the books on one shelf' do
    library_ex = Library.new
    a_f_shelf = Shelf.new(library_ex)
    a_book = Book.new("Allibaster")
    c_book = Book.new("Cookies!")
    a_book.enshelf(a_f_shelf)
    c_book.enshelf(a_f_shelf)
    expect(library_ex.all_books).to eq(["Allibaster", "Cookies!"])
  end

  it 'displays all the books on 2 shelves' do
    library_ex = Library.new
    a_f_shelf = Shelf.new(library_ex)
    g_z_shelf = Shelf.new(library_ex)
    f_book = Book.new("Frankenstein")
    z_book = Book.new("Zebras")
    f_book.enshelf(a_f_shelf)
    z_book.enshelf(g_z_shelf)
    expect(library_ex.all_books).to eq(["Frankenstein", "Zebras"])
  end

  it 'is aware of all the shelves within it' do
    library_ex = Library.new
    shelf_a = Shelf.new(library_ex)
    shelf_b = Shelf.new(library_ex)
    expect(library_ex.all_shelves). to include(shelf_a, shelf_b)
  end
end


