# frozen_string_literal: true

class AddIndexesToInvoicesAndInvoicesData < ActiveRecord::Migration[6.0]
  def change
    add_index :invoices, :operation_number
    add_index :invoice_data, :parcel_code
  end
end
