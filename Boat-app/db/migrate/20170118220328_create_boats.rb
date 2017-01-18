class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :amt_container
      t.string :location
      t.integer :company_id

      t.timestamps
    end
  end
end
