class AddColumnJournals < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :usefulness, :string
  end
end
