class AddUsidToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :user_id, :integer
  end
end
