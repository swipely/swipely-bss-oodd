class AddElfTables < ActiveRecord::Migration
  def change
    create_table :elves do |t|
      t.timestamps
    end

    create_table :reindeers do |t|
      t.integer :elf_id
      t.timestamps
    end
  end
end
