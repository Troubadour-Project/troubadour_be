class AddWinnerToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :winner, :boolean, default: false
  end
end
