# frozen_string_literal: true

FactoryBot.define do
  factory :invoice_datum do
    invoice
    parcel_code { '004211372050132' }
    item_qty { 1 }
    parcel_price { 3493 }
  end

  factory :invoice_datum_unbound, parent: :invoice_datum do
    invoice { nil }
  end

  factory :invoice_datum_seq, parent: :invoice_datum do
    sequence(:parcel_code) { |n| "#{n}004211372050132"[0..14] }
  end
end
