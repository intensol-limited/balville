class CreateNewevents < ActiveRecord::Migration

  def self.up
    create_table :newevents do |t|
      t.string :title
      t.datetime :date
      t.integer :photo_id
      t.text :text1
      t.text :text2
      t.integer :position

      t.timestamps
    end

    add_index :newevents, :id

    load(Rails.root.join('db', 'seeds', 'newevents.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "newevents"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/newevents"})
    end

    drop_table :newevents
  end

end
