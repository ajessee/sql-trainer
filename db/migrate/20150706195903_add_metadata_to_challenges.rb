class AddMetadataToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :metadata, :json
  end
end
