# frozen_string_literal: true

class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.string :guid, limit: 32
      t.integer :xml_batch_id
      t.date :creation_date

      t.timestamps
    end
  end
end
