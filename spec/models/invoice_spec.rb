# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject { build(:invoice) }

  it { should belong_to(:batch) }

  it { should validate_presence_of(:company_code) }
  it { should validate_inclusion_of(:company_code).in_range(0..9999) }

  it { should validate_presence_of(:operation_number) }
  it { should validate_inclusion_of(:operation_number).in_range(0..999_999_999) }

  it { should validate_presence_of(:operation_date) }
end
