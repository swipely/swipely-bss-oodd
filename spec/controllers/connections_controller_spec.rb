require 'spec_helper'

describe ConnectionsController do

  describe "GET 'index'" do
    context "as a guest" do
      before { get 'index' }

      it "returns http failure" do
        response.should_not be_success
      end
    end

    context "after identifying as a contact" do
      let(:me) { Contact.create!(first_name: 'Fred', last_name: 'Fred', email: 'fred@test.com', phone: '555-555-5555') }
      let(:other) { Contact.create!(first_name: 'Bob', last_name: 'Bob', email: 'bob@test.com', phone: '555-555-5555') }

      before do
        session[:contact_id] = me.id
        me.connect_to(other)
        get 'index'
      end

      it "retrieves connections" do
        assigns(:connections).should == [other]
      end
    end
  end

  describe "POST 'create'" do
    context "as a guest" do
      before { post 'create' }

      it "returns http failure" do
        response.should_not be_success
      end
    end

    context "after identifying as a contact" do
      let(:me) { Contact.create!(first_name: 'Fred', last_name: 'Fred', email: 'fred@test.com', phone: '555-555-5555') }
      let(:other) { Contact.create!(first_name: 'Bob', last_name: 'Bob', email: 'bob@test.com', phone: '555-555-5555') }

      before do
        session[:contact_id] = me.id
        post 'create', id:other.id
      end

      it "redirects to the contacts_path" do
        response.should redirect_to contacts_path
      end

      it "connects the users" do
        me.connected_to?(other).should be_true
      end
    end
  end
end
