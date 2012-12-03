Given /^I have a contact record$/ do
  @contact = Contact.new
  @contact.email = Random.email
  @contact.first_name = Random.firstname
  @contact.last_name = Random.lastname
  @contact.phone = Random.phone
  @contact.save!
end

When /^I go to the contacts page$/ do
  visit contacts_path
end

When /^I click on my name$/ do
  click_on @contact.first_name
end

When /^I click login$/ do
  click_on 'login'
end

When /^I click login next to my name$/ do
  within('tr', text: @contact.first_name) do
    click_on 'login'
  end
end

Then /^I see my name in the nav bar$/ do
  nav_bar = page.find('nav')
  nav_bar.should have_content @contact.first_name
end
