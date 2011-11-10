class CreateNewsblogs < ActiveRecord::Migration

  def self.up
    create_table :newsblogs do |t|
      t.string :title
      t.datetime :date
      t.integer :photo_id
      t.text :text1
      t.text :text2
      t.integer :position

      t.timestamps
    end

    add_index :newsblogs, :id

    load(Rails.root.join('db', 'seeds', 'newsblogs.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "newsblogs"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/newsblogs"})
    end

    drop_table :newsblogs
  end

end
