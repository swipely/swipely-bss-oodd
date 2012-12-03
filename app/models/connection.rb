class Connection < ActiveRecord::Base
  validates :contact1_id, :contact2_id, presence: true
  validates_uniqueness_of :contact1_id, scope: :contact2_id

  belongs_to :contact1, class_name: 'Contact', primary_key: :id, foreign_key: :contact1_id
  belongs_to :contact2, class_name: 'Contact', primary_key: :id, foreign_key: :contact2_id

  def self.connect(contact1, contact2)
    contact1, contact2 = [contact1, contact2].sort_by(&:id)
    
    c = Connection.new
    c.contact1_id = contact1.id
    c.contact2_id = contact2.id
    c.save!
  end

  def self.connected?(contact1, contact2)
    contact1, contact2 = [contact1, contact2].sort_by(&:id)
    exists?(:contact1_id => contact1.id, :contact2_id => contact2.id)
  end
  
  def self.for_contact(contact)
    connected_contacts = where(:contact1_id => contact.id).map(&:contact2) + where(:contact2_id => contact.id).map(&:contact1)
    connected_contacts.select { |c| c.id != contact.id }.sort_by(&:id)
  end
end
