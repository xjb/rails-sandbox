require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  let!(:user) do
    assign(:user, create(:user))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(user), 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[email]'
    end
  end
end
