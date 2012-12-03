class ProfilePage
  def description
    @subject.description
  end
end

class User
  alias_method :description, :user_bio
end

class Merchant
  # all good!
end

class SuperLocale
  def description
    "Located in #{city}, #{state}"
  end
end
