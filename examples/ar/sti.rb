# == Schema Information
#
# Table name: people
#
#  id              :integer      primary key
#  type            :string(255)
#  name            :string(255)
#  employee_number :integer
#  specialty       :string(255)
#

class Person < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
end

class Employee < Person
  attr_accessible :employee_number
  validates :employee_number, :presence => true
end

class Doctor < Employee
  attr_accessible :specialty
  validates :specialty, :presence => true
end

