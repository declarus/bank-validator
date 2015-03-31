class AddRoutingNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :routing_number, :string
  end
end
