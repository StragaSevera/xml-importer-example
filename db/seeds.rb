# frozen_string_literal: true

require_relative '../spec/services/data/sales_data'
batch = XmlParser.new(SALES_DATA).parse
batch.save!
