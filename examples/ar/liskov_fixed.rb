# == Schema Information
#
# Table name: profile_pages
#
#  uuid              :string(36)      primary key
#  subject_uuid      :string(255)
#  subject_type      :string(255)
#

class ProfilePage < ActiveRecord::Base

  validates_inclusion_of :subject_type, :in => %w{User Merchant SuperLocale}

  belongs_to :subject, :polymorphic => true, :primary_key => 'uuid', :foreign_key => 'subject_uuid'
end


# == Schema Information
#
# Table name: profile_pages
#
#  uuid              :string(36)      primary key
#
class User
  has_one :profile_page, :foreign_key => 'subject_uuid', :primary_key => 'uuid'
end
