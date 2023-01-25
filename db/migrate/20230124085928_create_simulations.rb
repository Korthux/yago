class CreateSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :simulations do |t|
      t.integer :annual_revenue
      t.string :profession
      t.integer :enterprise_number
      t.string :legal_name
      t.boolean :natural_person
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
