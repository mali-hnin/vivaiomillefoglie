require 'rails_helper'
require_relative '../support/devise'

RSpec.describe "Plants", type: :request do
  let(:valid_attributes) {
    {name: "Achillea",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    category: "erbacee perenni",
    esposizione: "sole",
    fioritura: "estate",
    altezza: "media",
    terreno: "secco",
    vaso: "12cm",
    disponibile: "true",
    novità: "true",
    utile_per: "farfalle",
    price_cents: "500",
    nascondi: "false"}
  }

  let(:invalid_attributes) {

  }

  let(:user) { create(:user) }

  describe "GET /index" do
    it "renders a successful response" do
      get plants_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get plant_url(plant)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    login_admin

    it "renders a successful response" do
      get new_plant_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get edit_plant_url(plant)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new plant" do
        expect {
          post plants_url, params: { plant: valid_attributes }
        }.to change(Plant, :count).by(1)
      end

      it "redirects to the created plant" do
      post plants_url, params: { plant: valid_attributes }
      expect(response).to redirect_to(plant_url(Plant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new plant" do
        expect {
          post plants_url, params: { plant: invalid_attributes }
        }.to change(Plant, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post plants_url, params: { plant: invalid_attributes }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "Beatrice", price_cents: "700"}
      }

      it "updates the requested plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(response).to have_http_status(200)
      end

      it "redirects to the plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(article), params: { plant: new_attributes }
        plant.reload
        expect(response).to redirect_to(plant_url(plant))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: invalid_attributes }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plant" do
      plant = Plant.create! valid_attributes
      expect {
        delete plant_url(article)
      }.to change(Plant, :count).by(-1)
    end

    it "redirects to the plants list" do
      plant = Plant.create! valid_attributes
      delete plant_url(plant)
      expect(response).to redirect_to(plants_url)
    end
  end
end
