# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :batch, null: false, foreign_key: true
      t.integer :company_code
      t.integer :operation_number
      t.date :operation_date

      t.timestamps
    end
  end
end
