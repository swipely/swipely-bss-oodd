class Connection < ActiveRecord::Base
  validates :contact1_id, :contact2_id, presence: true
  validates_uniqueness_of :contact1_id, scope: :contact2_id

  def self.connect(c1, c2)
    contact1, contact2 = [c1, c2].sort_by(&:id)

    # TODO: Implement me using associations!
  end

  def self.connected?(contact1, contact2)
    contact1, contact2 = [contact1, contact2].sort_by(&:id)
    exists?(:contact1_id => contact1.id, :contact2_id => contact2.id)
  end
end
