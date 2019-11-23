# frozen_string_literal: true

batch = XmlParser.new(File.read('spec/fixtures/files/sales_data.xml')).parse
batch.save!
