class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :title
      t.string :post
      t.binary :file

      t.timestamps
    end
  end
end
