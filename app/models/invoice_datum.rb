# frozen_string_literal: true

class InvoiceDatum < ApplicationRecord
  belongs_to :invoice

  validates :parcel_code, presence: true,
                          length: { is: 15 },
                          uniqueness: true,
                          case_sensitive: false
  validates :item_qty, presence: true, inclusion: 0..50
  validates :parcel_price, presence: true, inclusion: 1..90_000
end
