class AddTitleimgField < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :titleimg, :image
  end

  def self.down
    remove_column :vacancies, :titleimg
  end
end
