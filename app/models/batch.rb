# frozen_string_literal: true

class Batch < ApplicationRecord
  validates :guid, presence: true, length: { is: 32 }
  validates :xml_batch_id, presence: true
  validates :creation_date, presence: true
end
