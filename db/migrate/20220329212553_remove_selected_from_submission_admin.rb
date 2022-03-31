class RemoveSelectedFromSubmissionAdmin < ActiveRecord::Migration[6.1]
  def change
    remove_column :submission_admins, :selected, :boolean
  end
end
