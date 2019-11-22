# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    batch
    company_code { 1235 }
    operation_number { 45_734_328 }
    operation_date { '2019-11-21' }
    after(:build) { |invoice| invoice.invoice_data.build(attributes_for(:invoice_datum_seq)) }
  end

  # Due to quirks in Factory Bot, to maintain foreign key consistency
  # we explicitly clear data
  factory :invoice_without_data, parent: :invoice do
    after(:build) { |invoice| invoice.invoice_data.clear }
  end
end
