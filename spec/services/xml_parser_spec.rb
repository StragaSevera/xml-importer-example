# frozen_string_literal: true

require 'rails_helper'
require_relative 'data/sales_data'

RSpec.describe XmlParser do
  subject { XmlParser.new(SALES_DATA) }
  let(:batch) { subject.parse }

  it 'parses batch data' do
    expect(batch).to be_valid
    expect(batch.guid).to eq '16BA036FCC3D4AF7E05378A06D0ADD38'
    expect(batch.xml_batch_id).to eq 844_986
    expect(batch.creation_date).to eq Date.parse('21.05.2015')
    expect(batch.invoices.size).to eq 2
  end

  it 'parses first invoice' do
    invoice = batch.invoices.first
    expect(invoice.company_code).to eq 1234
    expect(invoice.operation_number).to eq 45_734_328
    expect(invoice.operation_date).to eq Date.parse('21.05.2015')
    expect(invoice.invoice_data.size).to eq 1
  end

  it 'parses second invoice' do
    invoice = batch.invoices.second
    expect(invoice.company_code).to eq 5678
    expect(invoice.operation_number).to eq 45_733_790
    expect(invoice.operation_date).to eq Date.parse('20.05.2015')
    expect(invoice.invoice_data.size).to eq 2
  end

  it 'parses first invoice datum' do
    invoice = batch.invoices.first
    datum = invoice.invoice_data.first
    expect(datum.parcel_code).to eq '114211372050132'
    expect(datum.item_qty).to eq 1
    expect(datum.parcel_price).to eq 3493
  end

  it 'parses second invoice datum' do
    invoice = batch.invoices.second
    datum = invoice.invoice_data.first
    expect(datum.parcel_code).to eq '114180267042133'
    expect(datum.item_qty).to eq 2
    expect(datum.parcel_price).to eq 3494
  end

  it 'parses third invoice datum' do
    invoice = batch.invoices.second
    datum = invoice.invoice_data.second
    expect(datum.parcel_code).to eq '114207400042141'
    expect(datum.item_qty).to eq 3
    expect(datum.parcel_price).to eq 6293
  end
end
