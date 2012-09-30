require 'spec_helper'

describe AnonymousUser do
  let(:body) { 'Today I used some service without even registering.' }

  def create_retrospection
    visit retrospection_path('today')
    fill_in 'Body', with: body
    click_on 'Create Retrospection'
    expect(page).to have_content(body)
  end

  def register_account
    visit new_user_registration_path
    fill_in 'Email', with: 'joe.anonymous@example.com'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    click_on 'Sign up'
    visit retrospection_path('today')
  end

  describe 'registration' do
    it "should should let a user register and keep all the work they've done" do
      create_retrospection
      register_account
      expect(page).to have_content(body)
    end
  end
end
