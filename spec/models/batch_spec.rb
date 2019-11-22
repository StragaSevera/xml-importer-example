# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Batch, type: :model do
  subject { build(:batch) }

  it { should have_many(:invoices).dependent(:destroy) }

  it { should validate_presence_of(:guid) }
  it { should validate_length_of(:guid).is_equal_to(32) }

  it { should validate_presence_of(:xml_batch_id) }

  it { should validate_presence_of(:creation_date) }
end
