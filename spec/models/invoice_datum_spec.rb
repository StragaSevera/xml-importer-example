# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvoiceDatum, type: :model do
  subject { build(:invoice_datum) }

  it { should belong_to(:invoice) }

  it { should validate_presence_of(:parcel_code) }
  it { should validate_length_of(:parcel_code).is_equal_to(15) }
  it { should validate_uniqueness_of(:parcel_code).case_insensitive }

  it { should validate_presence_of(:item_qty) }
  it { should validate_inclusion_of(:item_qty).in_range(0..50) }

  it { should validate_presence_of(:parcel_price) }
  it { should validate_inclusion_of(:parcel_price).in_range(1..90_000) }
end
