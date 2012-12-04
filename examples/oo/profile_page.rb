class ProfilePage
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
