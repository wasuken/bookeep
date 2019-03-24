class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.integer :amount
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
