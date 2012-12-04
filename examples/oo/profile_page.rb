class ProfilePage
  def initialize(subject)
    @subject_type = subject.subject_type
    @subject = subject
  end

  def description
    case @subject_type
    when 'User'
      @subject.user_bio
    when 'Merchant'
      @subject.description
    when 'SuperLocale'
      "Located in #{@subject.city}, #{@subject.state}"
    else
      raise "Unrecognized type #{subject_type}"
    end
  end
end

class User
  attr_accessor :user_bio
  
  def subject_type
    self.class.name
  end
end


class Merchant
  attr_accessor :description

  def subject_type
    self.class.name
  end
end

class MetroArea
  attr_accessor :city, :state

  def subject_type
    'SuperLocale'
  end
end
