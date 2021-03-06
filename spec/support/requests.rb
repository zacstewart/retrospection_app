module RequestMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret'
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include RequestMacros, :type => :request
end
