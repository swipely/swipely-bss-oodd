class Elf < ActiveRecord::Base
  has_many :reindeers,
           :class_name => Reindeer.name,
           :primary_key => :id,
           :foreign_key => :elf_id
end

class Reindeer < ActiveRecord::Base
  attr_accessible :elf_id

  belongs_to :elf,
             :class_name => Elf.name,
             :primary_key => :id,
             :foreign_key => :elf_id
end
