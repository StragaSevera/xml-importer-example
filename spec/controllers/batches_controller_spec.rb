# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BatchesController, type: :controller do
  let!(:batch) { create(:batch) }
  let!(:another_batch) { create(:batch_seq) }
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

  xdescribe 'POST #create' do
    it 'returns http success' do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    context 'with correct data' do
      before { delete :destroy, params: { id: batch } }

      it 'redirects to #index' do
        expect(response).to redirect_to action: :index
      end

      it 'deletes a batch' do
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
        expect(Batch.count).to eq 2
      end
    end
  end
end
