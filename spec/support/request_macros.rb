module RequestMacros
  def login_admin
    before(:each) do
      admin = User.create(email: 'test@test.org', password: "password", password_confirmation: "password", admin: true)
      sign_in admin
    end
  end

  # Uncomment if we ever make non-admin users
  # def login_user
  #   before(:each) do
  #     user = User.create(email: 'user@test.org', password: "12345", password_confirmation: "12345", admin: false)
  #     user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
  #     sign_in user
  #   end
  # end
end
