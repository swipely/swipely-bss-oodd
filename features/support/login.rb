module Login
  def login_as(contact)
    visit contact_path(contact)
    click_on 'login'
  end
end

World(Login)
