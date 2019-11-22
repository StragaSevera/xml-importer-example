# frozen_string_literal: true

class Batch < ApplicationRecord
  has_many :invoices, dependent: :destroy
  validates :guid, presence: true, length: { is: 32 }, uniqueness: true
  validates :xml_batch_id, presence: true, uniqueness: true
  validates :creation_date, presence: true
end
