class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :display_artist
      t.integer :ranking
      t.integer :year

      t.timestamps
    end
  end
end
