# frozen_string_literal: true

RSpec.shared_examples 'forbidden access' do
  it 'returns error message' do
    expect(body_json['errors']['message']).to eq 'Forbidden access'
  end

  it 'return forbidden status' do
    expect(response).to have_http_status(:forbidden)
  end
end
