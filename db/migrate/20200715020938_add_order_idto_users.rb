class AddOrderIdtoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :order_id, :integer
  end
end
