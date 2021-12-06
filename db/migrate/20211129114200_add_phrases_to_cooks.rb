class AddPhrasesToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :phrase, :string
    add_column :cooks, :material, :string
    add_column :cooks, :quantity, :string
    add_column :cooks, :arrange, :string
  end
end
