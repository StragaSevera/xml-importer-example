# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject { build(:invoice) }

  it { should belong_to(:batch) }

  it { should have_many(:invoice_data).dependent(:destroy) }
  # Shoulda Matchers do not have the way to validate association count
  [1, 5, 10].each do |i|
    it "is valid with invoice data count: #{i}" do
      sut = build(:invoice, invoice_data: [])
      i.times { sut.invoice_data << build(:invoice_data_unbound) }
      expect(sut).to be_valid
    end
  end
  [0, 11].each do |i|
    it "is invalid with invoice data count: #{i}" do
      sut = build(:invoice, invoice_data: [])
      i.times { sut.invoice_data << build(:invoice_data_unbound) }
      expect(sut).not_to be_valid
    end
  end

  it { should validate_presence_of(:company_code) }
  it { should validate_inclusion_of(:company_code).in_range(0..9999) }

  it { should validate_presence_of(:operation_number) }
  it { should validate_inclusion_of(:operation_number).in_range(0..999_999_999) }

  it { should validate_presence_of(:operation_date) }
end
