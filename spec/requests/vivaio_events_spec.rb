# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'VivaioEvent', type: :request do
  let(:valid_attributes) do
    {
      title: 'Presentazione piante americane',
      content: '',
      data_evento: DateTime.now.beginning_of_day + 2.weeks,
      data_fine_evento: DateTime.now.beginning_of_day + 2.weeks + 3.hours
    }
  end

  describe 'GET /index' do
    it 'responds successfully' do
      VivaioEvent.destroy_all
      get vivaio_events_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'responds successfully' do
      event = VivaioEvent.create! valid_attributes
      get vivaio_event_url(event)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new' do
    context 'no admin logged in' do
      it 'does not show new form and redirects to login form' do
        get new_vivaio_event_url
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'admin logged in' do
      login_admin
      it 'renders a successful response' do
        get new_vivaio_event_url
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /edit' do
    context 'no admin logged in' do
      it 'does not show new form and redirects to login form' do
        event = VivaioEvent.create! valid_attributes
        get edit_vivaio_event_url(event)
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'admin logged in' do
      login_admin
      it 'renders a successful response' do
        event = VivaioEvent.create! valid_attributes
        get edit_vivaio_event_url(event)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /create' do
    context 'admin logged in' do
      login_admin
      it 'creates a new event record' do
        expect do
          post vivaio_events_url, params: { vivaio_event: valid_attributes }
        end.to change { VivaioEvent.count }.by(1)
        expect(response).to redirect_to(vivaio_event_path(VivaioEvent.last))
      end
    end

    context 'no admin logged in' do
      it 'does not create a new event' do
        expect do
          post vivaio_events_url, params: { vivaio_event: valid_attributes }
        end.to change { VivaioEvent.count }.by(0)
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'PATCH /update' do
    let(:new_attributes) do
      {
        data_evento: DateTime.now.beginning_of_day + 1.week,
        data_fine_evento: DateTime.now.beginning_of_day + 1.week + 2.hours
      }
    end
    context 'with admin logged in' do
      login_admin
      it 'updates the event with the new attributes' do
        event = VivaioEvent.create! valid_attributes
        patch vivaio_event_url(event), params: { vivaio_event: new_attributes }
        event.reload
        expect(response).to redirect_to(vivaio_event_url(event))
        expect(event.data_evento).to eq(new_attributes[:data_evento])
        expect(event.data_fine_evento).to eq(new_attributes[:data_fine_evento])
      end
    end

    context 'no admin logged in' do
      it 'fails to update' do
        event = VivaioEvent.create! valid_attributes
        patch vivaio_event_url(event), params: { vivaio_event: new_attributes }
        expect(event.data_evento).to_not eq(new_attributes[:data_evento])
        expect(event.data_fine_evento).to_not eq(new_attributes[:data_fine_evento])
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with admin logged in' do
      login_admin
      it 'destroys the requested event' do
        event = VivaioEvent.create! valid_attributes
        expect do
          delete vivaio_event_url(event)
        end.to change(VivaioEvent, :count).by(-1)
        expect(response).to redirect_to(vivaio_events_url)
      end
    end

    context 'no admin logged in' do
      it "doesn't destroy the requested event" do
        event = VivaioEvent.create! valid_attributes
        expect do
          delete vivaio_event_url(event)
        end.to change(VivaioEvent, :count).by(0)
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end
