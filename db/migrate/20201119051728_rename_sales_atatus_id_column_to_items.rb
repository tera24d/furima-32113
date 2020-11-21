class RenameSalesAtatusIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sales_atatus_id, :sales_status_id
  end
end
