# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :batch
  has_many :invoice_data, dependent: :destroy

  validates :invoice_data, length: { in: 1..10 }
  validates :company_code, presence: true, inclusion: 0..9999
  validates :operation_number, presence: true, inclusion: 0..999_999_999
  validates :operation_date, presence: true
end
