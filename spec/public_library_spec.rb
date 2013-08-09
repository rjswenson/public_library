require_relative '../lib/public_library.rb'


describe 'Book(class)' do 
  it 'exists' do
    expect(Book).to be
  end
end

describe '#title within Book' do
  it 'receives and processes #title' do
    test_book = Book.new("")
    test_book.title = "foo"
    expect(test_book.title).to eq("foo")
  end
  it 'alternatively stores a #title' do
    test_book = Book.new("bar")
    expect(test_book.title).to eq("bar")
  end
end

describe '#enshelf within Book' do
  it 'puts a book on a shelf' do
    test_book = Book.new("Magic")
    sample_shelf = Shelf.new
    test_book.enshelf(sample_shelf)
    expect(test_book.shelf).to eq(sample_shelf)
  end
end

    

