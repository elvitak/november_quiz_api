RSpec.describe 'POST /api/payments' do
  let(:stripe_helper) { Strpe.Mock.create_test_hekper }
  let(:valid_token) { stripe_helper.generate_card_token }
  before do
    post '/api/payments', params:
    { payment:
    { stripeToken: valid_token,
      currency: 'sek',
      amount: 1000,
      email: 'random@guy.com' } }
  end

  it { is_expected.to have_http_status 201 }

  it 'is expected to return transaction info that includes paid: true' do
    expected_response = { paid: true }
    expect(response_json).to eq extected_response
  end
end
