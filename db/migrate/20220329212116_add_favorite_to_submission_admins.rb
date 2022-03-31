class AddFavoriteToSubmissionAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :submission_admins, :favorite, :boolean, default: false
  end
end
