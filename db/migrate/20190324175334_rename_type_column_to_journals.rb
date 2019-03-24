class RenameTypeColumnToJournals < ActiveRecord::Migration[5.2]
  def change
    rename_column :journals, :type, :kind
  end
end
