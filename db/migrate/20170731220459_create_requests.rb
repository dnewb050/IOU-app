class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :creditor, foreign_key: true
      t.references :debtor, foreign_key: true
      t.string :line_item_name
      t.decimal :amount, precision: 8, scale: 2
      t.string :comment
      t.boolean :acknowledged_request_status

      t.timestamps
    end
  end
end
