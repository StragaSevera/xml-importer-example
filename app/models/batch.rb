# frozen_string_literal: true

class Batch < ApplicationRecord
  has_many :invoices
  validates :guid, presence: true, length: { is: 32 }
  validates :xml_batch_id, presence: true
  validates :creation_date, presence: true
end
