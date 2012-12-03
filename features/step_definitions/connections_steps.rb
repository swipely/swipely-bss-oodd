Given /^There is a contact record for Fred$/ do
  @me = Contact.new
  @me.email = 'me@test.com'
  @me.first_name = 'Me'
  @me.last_name = 'Me'
  @me.phone = '555-555-5555'
  @me.save!

  @fred = Contact.new
  @fred.email = 'fred@test.com'
  @fred.first_name = 'Fred'
  @fred.last_name = 'Fred'
  @fred.phone = '555-555-5555'
  @fred.save!

  login_as(@me)
end

Given /^We are not connected$/ do
end

When /^I click the Connect button next to Fred's name$/ do
  visit contacts_path
  within('tr', text: @fred.first_name) do
    click_on 'Connect'
  end
end

Then /^The button changes to the text "Connected"$/ do
  fred_row = page.find('tr', text: @fred.first_name)
  fred_row.should have_content 'Connected'
end

Given /^We are connected$/ do
  @me.connect_to(@fred)
end

When /^I go to the My Connections page$/ do
  visit connections_path
end

Then /^I see Fred listed among my connections$/ do
  page.find('tr', :text => @fred.first_name).should be_present
end
