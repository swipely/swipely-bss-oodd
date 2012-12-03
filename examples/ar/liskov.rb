# == Schema Information
#
# Table name: profile_pages
#
#  uuid              :string(36)      primary key
#  subject_id        :string(255)
#  subject_type      :string(255)
#

class ProfilePage < ActiveRecord::Base

  validates_inclusion_of :subject_type, :in => %w{User Merchant SuperLocale}

  def subject
    case subject_type
    when 'User'
      User.find(subject_id)
    when 'Merchant'
      Partners::Brand.find_by_pretty_url("#{subject_id}")
    when 'SuperLocale'
      SuperLocale.find_by_pretty_url("#{subject_id}")
    else
      raise "Unrecognized type #{subject_type}"
    end
  end
end
