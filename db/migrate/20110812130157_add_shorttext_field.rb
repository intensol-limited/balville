class AddShorttextField < ActiveRecord::Migration
  def self.up
    add_column :projects, :shorttext, :text
  end

  def self.down
    remove_column :projects, :shorttext
  end
end
