# frozen_string_literal: true

# Using Heredoc instead of plain file - this way we get free parallel testing
# Edited some values for better unit testing
SALES_DATA = <<~HEREDOC
  <?xml version="1.0" encoding="UTF-8"?><Root>
    <FileAttribute>
      <GUID>16BA036FCC3D4AF7E05378A06D0ADD38</GUID>
    </FileAttribute>
    <FileData>
      <Batch>
        <BatchID>844986</BatchID>
        <CreationDate>21.05.2015</CreationDate>
      </Batch>
      <Invoice>
        <InvoiceOperation>
          <CompanyCode>1234</CompanyCode>
          <InvoiceOperationNumber>45734328</InvoiceOperationNumber>
          <InvoiceOperationDate>21.05.2015</InvoiceOperationDate>
        </InvoiceOperation>
        <InvoiceData>
          <ParcelCode>114211372050132</ParcelCode>
          <ItemQty>1</ItemQty>
          <ParcelPrice>3493</ParcelPrice>
        </InvoiceData>
      </Invoice>
      <Invoice>
        <InvoiceOperation>
          <CompanyCode>5678</CompanyCode>
          <InvoiceOperationNumber>45733790</InvoiceOperationNumber>
          <InvoiceOperationDate>20.05.2015</InvoiceOperationDate>
        </InvoiceOperation>
        <InvoiceData>
          <ParcelCode>114180267042133</ParcelCode>
          <ItemQty>2</ItemQty>
          <ParcelPrice>3494</ParcelPrice>
        </InvoiceData>
        <InvoiceData>
          <ParcelCode>114207400042141</ParcelCode>
          <ItemQty>3</ItemQty>
          <ParcelPrice>6293</ParcelPrice>
        </InvoiceData>
      </Invoice>
    </FileData>
  </Root>
HEREDOC
