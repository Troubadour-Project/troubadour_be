class CreateSubmissionAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_admins do |t|
      t.boolean :selected
      t.references :admin, null: false, foreign_key: true
      t.references :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
