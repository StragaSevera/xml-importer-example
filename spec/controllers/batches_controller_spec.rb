# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BatchesController, type: :controller do
  let(:batch) { create(:batch) }
  let(:another_batch) { create(:batch_seq) }
  let(:invoice) { create(:invoice, batch: batch) }
  let(:invoice_datum) { create(:invoice_datum, invoice: invoice) }

  describe 'GET #index' do
    before { get :index }
    it 'renders :index' do
      expect(response).to render_template :index
    end

    it 'populates an array of batches' do
      expect(assigns(:batches)).to match_array([batch, another_batch])
    end
  end

  describe 'POST #create' do
    context 'with valid file' do
      before do
        post :create, params: { batch: { file: fixture_file_upload('files/sales_data.xml') } }
      end

      it 'redirects to #index' do
        expect(response).to redirect_to action: :index
      end

      it 'creates a batch' do
        batch = Batch.where(guid: '16BA036FCC3D4AF7E05378A06D0ADD38')
        expect(batch.count).to eq 1
      end

      it 'does not create second batch' do
        post :create, params: { batch: { file: fixture_file_upload('files/sales_data.xml') } }
        expect(Batch.count).to eq 1
      end

      it 'shows notice if second batch' do
        post :create, params: { batch: { file: fixture_file_upload('files/sales_data.xml') } }
        expect(controller).to set_flash[:notice]
      end
    end

    context 'with invalid file' do
      before do
        post :create, params: { batch: { file: fixture_file_upload('files/invalid_data.xml') } }
      end

      it 'redirects to #index' do
        expect(response).to redirect_to action: :index
      end

      it 'does not create a batch' do
        expect(Batch.count).to eq 0
      end

      it 'shows error' do
        expect(controller).to set_flash[:alert]
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with correct data' do
      before { delete :destroy, params: { id: batch } }

      it 'redirects to #index' do
        expect(response).to redirect_to action: :index
      end

      it 'deletes a batch' do
        another_batch # Loading the let block
        expect(Batch.count).to eq 1
        expect(Batch.first).to eq another_batch
      end
    end

    context 'with incorrect data' do
      before { delete :destroy, params: { id: batch.id + 10 } }

      it 'redirects to #index' do
        expect(response).to redirect_to action: :index
      end

      it 'does not delete a batch' do
        another_batch
        expect(Batch.count).to eq 2
      end

      it 'shows error' do
        expect(controller).to set_flash[:alert]
      end
    end
  end
end
