class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :genre
      t.string :song_title

      t.timestamps
    end
  end
end
