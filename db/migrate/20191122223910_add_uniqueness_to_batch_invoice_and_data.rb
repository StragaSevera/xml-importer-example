class AddUniquenessToBatchInvoiceAndData < ActiveRecord::Migration[6.0]
  def change
    add_index :batches, :guid, unique: true
    add_index :batches, :xml_batch_id, unique: true
    remove_index :invoices, :operation_number
    add_index :invoices, :operation_number, unique: true
    remove_index :invoice_data, :parcel_code
    add_index :invoice_data, :parcel_code, unique: true
  end
end
