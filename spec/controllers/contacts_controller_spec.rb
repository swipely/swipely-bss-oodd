require 'spec_helper'

describe ContactsController do

  describe "GET 'index'" do
    context "as a guest" do
      before { get 'index' }

      it "returns http success" do
        response.should be_success
      end
    end
    
    context "with a current user" do
      let(:contact) { Contact.create! email: 'john@example.com', first_name: 'john', last_name: 'doe', phone: '123-567-1234' }
      before { session[:contact_id] = contact.id }
      before { get 'index' }

      it 'should have a current user' do
        assigns(:current_user).should == contact
      end
    end
  end

end
