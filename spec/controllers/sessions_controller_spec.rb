require 'spec_helper'

describe SessionsController do

  describe "POST 'create'" do
    let(:contact_id) { '1234' }
    before { post 'create', id: contact_id }

    it "redirects to contacts" do
      response.should redirect_to(contacts_path)
    end

    it 'creates a cookie' do
      session[:contact_id].should == contact_id
    end
  end

end
