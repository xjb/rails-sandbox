require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create :user }

  before do
    user
  end

  context 'when before sign_in' do
    it 'index -> new' do
      visit users_path

      click_on I18n.t('users.index.new')

      expect(page).to have_current_path new_user_path, ignore_query: true
    end

    it 'new -> save' do
      visit new_user_path

      fill_in User.human_attribute_name(:name), with: Faker::Name.name
      fill_in User.human_attribute_name(:email), with: Faker::Internet.email
      select User.roles.keys.sample, from: 'user_role'
      select 'prefecture', from: 'user_prefecture_id'

      click_on I18n.t('helpers.submit.create')

      expect(page).to have_content I18n.t('users.create.notice')
      expect(page).to have_current_path user_path(User.last)
    end

    it 'show -> edit' do
      visit user_path(user)

      click_on I18n.t('users.edit.edit')

      expect(page).to have_current_path edit_user_path(user)
    end

    it 'edit -> save' do
      visit edit_user_path(user)

      fill_in User.human_attribute_name(:name), with: Faker::Name.name
      fill_in User.human_attribute_name(:email), with: Faker::Internet.email
      select User.roles.keys.sample, from: 'user_role'
      select 'prefecture', from: 'user_prefecture_id'

      click_on I18n.t('helpers.submit.update')

      expect(page).to have_current_path user_path(user)
      expect(page).to have_content I18n.t('users.update.notice')
    end

    it 'index -> destroy' do
      create_list :user, 10
      visit users_path

      click_on I18n.t('users.index.destroy'), match: :first
      # NOTE: js do not work.
      # click_on 'Ok'

      expect(page).to have_current_path users_path
      expect(page).to have_content I18n.t('users.destroy.notice')
    end
  end

  context 'when signed_in' do
    pending "add some scenarios (or delete) #{__FILE__}"
  end
end
