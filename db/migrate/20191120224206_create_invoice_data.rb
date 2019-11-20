# frozen_string_literal: true

class CreateInvoiceData < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_data do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :parcel_code, length: 15
      t.integer :item_qty
      t.integer :parcel_price

      t.timestamps
    end
  end
end
