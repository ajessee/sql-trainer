class AddOrderToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :order, :integer
  end
end
