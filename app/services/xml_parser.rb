# frozen_string_literal: true

class XmlParser
  def initialize(data_string)
    @doc = Nokogiri::XML(data_string)
    raise ArgumentError unless @doc.errors.empty?
  end

  def guid
    @doc.at_xpath('//GUID').content
  end

  def parse
    batch = Batch.new
    batch.guid = guid
    batch.xml_batch_id = @doc.at_xpath('//BatchID').content
    batch.creation_date = @doc.at_xpath('//CreationDate').content
    each_invoice(@doc) { |invoice| batch.invoices << invoice }
    batch
  end

  private

  def each_invoice(doc)
    doc.xpath('//Invoice').each do |xml_invoice|
      invoice = Invoice.new
      invoice.company_code = xml_invoice.at_xpath('.//CompanyCode').content
      invoice.operation_number = xml_invoice.at_xpath('.//InvoiceOperationNumber').content
      invoice.operation_date = xml_invoice.at_xpath('.//InvoiceOperationDate').content
      each_datum(xml_invoice) { |datum| invoice.invoice_data << datum }
      yield invoice
    end
  end

  def each_datum(xml_invoice)
    xml_invoice.xpath('.//InvoiceData').each do |xml_datum|
      datum = InvoiceDatum.new
      datum.parcel_code = xml_datum.at_xpath('.//ParcelCode').content
      datum.item_qty = xml_datum.at_xpath('.//ItemQty').content
      datum.parcel_price = xml_datum.at_xpath('.//ParcelPrice').content
      yield datum
    end
  end
end
