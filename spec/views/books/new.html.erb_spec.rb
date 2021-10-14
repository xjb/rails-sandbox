require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      title: "MyString",
      type: "",
      description: "MyText",
      book: nil
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[type]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[book_id]"
    end
  end
end
