require 'spec_helper'

describe Connection do
  let(:a) { Contact.create!(first_name: 'Fred', last_name: 'Fred', email: 'fred@test.com', phone: '555-555-5555') }
  let(:b) { Contact.create!(first_name: 'Bob', last_name: 'Bob', email: 'bob@test.com', phone: '555-555-5555') }
  let(:c) { Contact.create(email: Random.email, first_name: Random.firstname, last_name: Random.lastname, phone: Random.phone) }

  describe ".connect" do
    before { Connection.connect(a, b) }

    it 'creates a Connection record in the database' do
      Connection.exists?(contact1_id: a.id, contact2_id: b.id).should be_true
    end

    it 'allows a Contact to be connected to more than one other contact' do
      Connection.connect(a, c)
      Connection.exists?(contact1_id: a.id, contact2_id: c.id).should be_true
    end

    it 'does not create a connection between two users who are already connected' do
      expect { Connection.connect(a, b) }.to raise_error(ActiveRecord::ActiveRecordError)
    end
  end

  describe ".connected?" do
    before { Connection.connect(a, b) }

    it 'returns true when the connection is in the database' do
      Connection.connected?(a, b).should be_true
    end

    it 'returns true when the connection is in the database, even when queried in the opposite direction' do
      Connection.connected?(b, a).should be_true
    end

    it 'returns false when there is no connection' do
      Connection.connected?(b, c).should be_false
    end
  end

  describe ".for_contact" do
    before do
      Connection.connect(a, b)
      Connection.connect(a, c)
      Connection.connect(b, c)
    end

    it "returns a list of all of a contact's connections" do
      Connection.for_contact(a).should == [b, c]
      Connection.for_contact(b).should == [a, c]
      Connection.for_contact(c).should == [a, b]
    end
  end
end
