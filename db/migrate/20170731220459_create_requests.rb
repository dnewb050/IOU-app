class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :creditor
      t.references :debtor
      t.string :line_item_name
      t.integer :amount
      t.string :comment
      t.boolean :acknowledged_request_status

      t.timestamps
    end
  end
end
