require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:content) { create(:movie) }
    let(:purchase_option) { create(:purchase_option) }

    before do
      controller.instance_variable_set(:@current_user, user)
      allow(ContentFinder).to receive(:find).and_return(content)
    end

    context 'when content and purchase option exist' do
      before do
        allow(content.purchase_options).to receive(:find_by).and_return(purchase_option)
      end

      context 'when user does not have an active purchase' do
        before do
          allow(user).to receive(:active_purchase?).with(content).and_return(false)
        end
        it 'creates a new purchase' do
          expect {
            post :create, params: { user_id: user.id, purchase: { content_id: content.id, content_type: 'Movie', purchase_option_id: purchase_option.id } }
          }.to change(Purchase, :count).by(1)

          expect(response).to have_http_status(:created)
          expect(JSON.parse(response.body)).to eq({
            'message' => 'Purchase created successfully'
          })
        end
      end
    end
  end
end
