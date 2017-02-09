class CreateSwotTables < ActiveRecord::Migration[5.0]
  def change
    create_table :swot_tables do |t|
      t.string :title
      t.text :strength
      t.text :weakness
      t.text :opportunity
      t.text :threats

      t.timestamps
    end
  end
end
