require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      title: "MyString",
      type: "",
      description: "MyText",
      book: nil
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[type]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[book_id]"
    end
  end
end
