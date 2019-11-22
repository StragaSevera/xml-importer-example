# frozen_string_literal: true

FactoryBot.define do
  factory :batch do
    guid { '33BA036FCC3D4AF7E05378A06D0ADD38' }
    xml_batch_id { 1 }
    creation_date { '2019-11-21' }
  end

  factory :batch_seq, parent: :batch do
    sequence :guid do |n|
      "#{n}44BA036FCC3D4AF7E05378A06D0ADD38"[0..31]
    end
    sequence(:xml_batch_id) { |n| n + 1 }
  end
end
