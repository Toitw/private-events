class AddCreatorIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :creator_id, :bigint
    add_foreign_key :events, :users, column: :creator_id
  end
end
