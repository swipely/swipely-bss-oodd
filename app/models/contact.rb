class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone

  validates :email, :first_name, :last_name, :phone, presence: true
  validates :phone, length:{ in: 10..11 }
  validates :email, uniqueness: { case_sensitive: false }

  before_save { |contact| contact.email = email.downcase }

  default_scope order: 'contacts.created_at DESC'

  def phone=(num)
    num.gsub!(/\D/, '') if num.is_a?(String)
    super(num)
  end

  def connect_to(other)
    Connection.connect(self, other)
  end
  
  def connected_to?(other)
    Connection.connected?(self, other)
  end

  # Return: an array of Contacts this is connected to  
  def connections
    # TODO: Implement me using associations!
  end
end
