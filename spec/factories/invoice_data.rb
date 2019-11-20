# frozen_string_literal: true

FactoryBot.define do
  factory :invoice_datum do
    invoice
    parcel_code { '004211372050132' }
    item_qty { 1 }
    parcel_price { 3493 }
  end

  factory :invoice_data_unbound, parent: :invoice_datum do
    invoice { nil }
  end
end
