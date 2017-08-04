class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :request, foreign_key: true
      t.decimal :amount
      t.boolean :acknowledged_payment_status, precision: 8, scale: 2

      t.timestamps
    end
  end
end
