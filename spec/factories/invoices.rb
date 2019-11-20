# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    batch
    company_code { 1235 }
    operation_number { 45_734_328 }
    operation_date { '2019-11-21' }
  end
end
