# Xml Importer Example
This example project is made for importing information about batches of invoices into DB.

## Database structure
All fields are required, but we do not set `not null` in db because the common practice is to
 validate it in the Rails.
### batches table
1) `id`: `bigserial`, primary key. Not `serial` because Rails uses `bigserial` by default in case
 that `serial` will be too small.
2) `guid`: `varchar(32)`, unique. Not `uuid` because ActiveRecord does not support it natively
, only by
 forcing a column type, and it may harm usability - YAGNI. One
 file
 equals one batch, therefore, we can store file guids in the
 batch
 table.
3) `xml_batch_id`: `integer`, unique. Not simply naming `batch_id` because of confusion with primary keys.
4) `creation_date`: `date`.
5) `created_at`, `updated_at`: `timestamp`. Default ActiveRecord columns.

### invoices table
1) `id`: `bigserial`, primary key.
2) `batch_id`: `bigint`, foreign key. We assume that batches have a business value themselves, if
 not, this column may be deleted to save space.
2) `company_code`: `integer`.
3) `operation_number, unique`: `integer`.
4) `operation_date`: `date`.
5) `created_at`, `updated_at`: `timestamp`. Default ActiveRecord columns.

Indexes: `batch_id` (default Rails), `operation_number`

### invoice_data table
1) `id`: `bigserial`, primary key.
2) `invoice_id`: `bigint`, foreign key.
3) `parcel_code`: `varchar(15)`, unique. We assume that `000007400042141 != 7400042141`, because leading zeroes are significant, therefore, we use a text column type.
4) `item_qty`: `integer`. Not `smallint` because of ActiveRecord.
5) `parcel_price`: `integer`. We assume that all prices are integral, therefore, not using `decimal` type.

Indexes: `invoice_id` (default Rails), `parcel_code` 
