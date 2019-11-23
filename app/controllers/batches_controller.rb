# frozen_string_literal: true

class BatchesController < ApplicationController
  def create
    parser = XmlParser.new(batch_params[:file].read)
    if Batch.exists?(guid: parser.guid)
      flash[:notice] = 'XML already added'
    else
      parser.parse.save
    end
  rescue ArgumentError
    flash[:alert] = 'Malformed XML'
  ensure
    redirect_to action: :index
  end

  def index
    @batches = Batch.all
  end

  def destroy
    batch = Batch.find_by(id: params[:id])
    if batch
      batch.destroy
    else
      flash[:alert] = 'Wrong batch id'
    end
    redirect_to action: :index
  end

  private

  def batch_params
    params.require(:batch).permit(:file)
  end
end
