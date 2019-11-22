# frozen_string_literal: true

class BatchesController < ApplicationController
  def create; end

  def index
    @batches = Batch.all
  end

  def destroy
    batch = Batch.find_by(id: params[:id])
    batch&.destroy
    redirect_to action: :index
  end

  private

  def batch_params
    params.require(:batch).permit(:file)
  end
end
