class Elf < ActiveRecord::Base
  has_many :reindeers,
           :class_name => Reindeer.name,
           :primary_key => :id,
           :foreign_key => :elf_id
end
