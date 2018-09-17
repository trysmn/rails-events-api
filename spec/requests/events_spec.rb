require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  # initialize test data
  let!(:events) { create_list(:event, 10) }
  let(:event_id) { events.first.id }

  # Test suite for GET /api/events
  describe 'GET /api/events' do
    # make HTTP get request before each example
    before { get '/api/events' }

    it 'returns events' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    # ensure that the request is 'ok' - i.e. it has succeeded:
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/events/:id
  describe 'GET /api/events/:id' do
    before { get "/api/events/#{event_id}" }

    # we have two scenarios when we are looking for a specific event:
    # 1. the event exists:
    context 'when the event exists' do
      it 'returns the event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(event_id)
      end

      # ensure that the request is 'ok' - i.e. it has succeeded:
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    # 2. the event doesn't exist:
    context 'when the event does not exist' do
      let(:event_id) { 100 }

      # ensure that the server shows that it could not find what was requested:
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  # Test suite for POST /api/events
  describe 'POST /api/events' do
    # valid payload
    let(:valid_attributes) { { start_time: '2001-02-03T04:05:06+00:00', end_time: '2001-02-03T05:05:06+00:00', label: "Event one", category: "blue" } }

    context 'when the request is valid' do
      before { post '/api/events', params: valid_attributes }

      it 'creates an event' do
        expect(json['start_time']).to eq('2001-02-03T04:05:06+00:00')
      end

      # ensure that the request has been fulfilled and one or more new resources has been created:
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/events', params: { start_time: '2001-02-03T04:05:06+00:00' } }

      # ensure that the code returned matches the fact that the content of the request was understood, but not valid:
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: End time can't be blank, Label can't be blank, Category can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/events/:id
  describe 'PUT /api/events/:id' do
    let(:valid_attributes) { { start_time: '2001-02-03T04:05:06+00:00' } }

    context 'when the record exists' do
      before { put "/api/events/#{event_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /api/events/:id
  describe 'DELETE /api/events/:id' do
    before { delete "/api/events/#{event_id}" }

    # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end













