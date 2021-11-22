class AddTmpressionsCountToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :impressions_count, :imteger, default: 0
  end
end
