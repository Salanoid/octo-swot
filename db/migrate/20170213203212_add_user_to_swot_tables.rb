class AddUserToSwotTables < ActiveRecord::Migration[5.0]
  def change
    add_reference :swot_tables, :user, foreign_key: true
  end
end
