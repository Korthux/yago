class EnterpriseNumberChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:simulations, :enterprise_number, :string)
  end
end
