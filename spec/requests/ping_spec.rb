# frozen_string_literal: true

require 'spec_helper'

RSpec.describe '/v1/ping' do
  it_behaves_like 'GET one'

  it 'returns "pong""' do
    get '/v1/ping'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({ 'ping' => 'pong' })
  end
end
