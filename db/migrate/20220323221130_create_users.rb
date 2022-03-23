class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :genre
      t.string :song_title
      t.boolean :selected
      t.integer :user_type

      t.timestamps
    end
  end
end
