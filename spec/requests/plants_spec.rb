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
    prezzo: "5",
    nascondi: "false"}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

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
    context "no admin logged in" do
      it "does not show new form and redirects to login form" do
        get new_plant_url
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "admin logged in" do
      login_admin
      it "renders a successful response" do
        get new_plant_url
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /edit" do
    context "no admin logged in" do
      it "does not show edit form and redirects to login form" do
        plant = Plant.create! valid_attributes
        get edit_plant_url(plant)
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "admin logged in" do
      login_admin
      it "renders a successful response" do
        plant = Plant.create! valid_attributes
        get edit_plant_url(plant)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /create" do
    context "with admin logged in and valid parameters" do
      login_admin

      it "creates a new plant record" do
        expect {
        post plants_path, params: { plant: valid_attributes }
      }.to change{ Plant.count }.by(1)
      end

      it "redirects to the created plant" do
        post plants_path, params: { plant: valid_attributes }
        expect(response).to redirect_to(plant_url(Plant.last))
      end
    end

    context "with valid parameters but no admin logged in" do
      it "does not create a new plant" do
        expect {
        post plants_url, params: { plant: valid_attributes }
      }.to change(Plant, :count).by(0)
      end

      it "redirects to login" do
        post plants_url, params: { plant: valid_attributes }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "with invalid parameters" do
      login_admin

      it "does not create a new plant" do
        expect {
          post plants_url, params: { plant: invalid_attributes }
        }.to change(Plant, :count).by(0)
      end

      it "renders 'new' template" do
        post plants_url, params: { plant: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) {
      {name: "Beatrice", prezzo: Money.new(700)}
    }
    context "with valid parameters and admin logged in" do
      login_admin

      it "updates the requested plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(response).to redirect_to(plant_url(plant))
        expect(plant.name).to eq(new_attributes[:name])
        expect(plant.prezzo).to eq(new_attributes[:prezzo])
      end
    end

    context "with invalid parameters" do
      login_admin
      it "fails to update" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: invalid_attributes }
        plant.reload
        expect(response).to render_template(:edit)
        expect(plant.name).to eq(valid_attributes[:name])
        expect(plant.name).to_not eq(invalid_attributes[:name])
      end
    end

    context "without admin logged in" do
      it "fails to update" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(response).to redirect_to(new_user_session_url)
        expect(plant.name).to_not eq(new_attributes[:name])
        expect(plant.prezzo).to_not eq(new_attributes[:prezzo])
      end
    end
  end

  describe "DELETE /destroy" do
    context "with admin logged in" do
      login_admin
      it "destroys the requested plant" do
        plant = Plant.create! valid_attributes
        expect {
          delete plant_url(plant)
        }.to change(Plant, :count).by(-1)
      end

      it "redirects to the plants list" do
        plant = Plant.create! valid_attributes
        delete plant_url(plant)
        expect(response).to redirect_to(plants_url)
      end
    end

    context "without admin logged in" do
      it "doesn't destroy the requested plant" do
        plant = Plant.create! valid_attributes
        expect {
          delete plant_url(plant)
        }.to change(Plant, :count).by(0)
      end
    end
  end

  describe ".export", type: :feature do
    login_admin
    plants = Plant.all.alphabetically
    it "exports catalogue to CSV fileXLSX file" do
      visit admin_catalogo_url
      click_on("Esporta catalogo CSV")
      expect_download(
        content: plants.to_csv,
        filename: "catalogo_vivaio_#{Date.today}.csv",
        content_type: "text/csv"
      )
    end

    it "exports catalogue to XLSX file" do
      visit admin_catalogo_url
      click_on("Esporta catalogo Excel")
      expect_download(
        # content is only here as place-holder, if you want to check inside excel file needs specific gem, currently unnecessary
        content: "a",
        filename: "catalogo_vivaio.xlsx",
        content_type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      )
    end

    def expect_download(filename:, content_type:, content:)
      expect(page.response_headers['Content-Type']).to include content_type
      expect(page.response_headers['Content-Disposition']).to include "filename=\"#{filename}\""
      expect(page.body).to include content
    end
  end

  # describe ".export", type: :feature do
  #   login_admin
  #   it "generates xlxs file" do
  #     visit admin_catalogo_url
  #     click_on("Esporta catalogo Excel")
  #     wait_for_download
  #     expect(downloads).to match([])
  #     expect(downloads.length).to eq(1)
  #     expect(download).to match(/.*\.xlsx/)
  #   end
  #   # it "generates csv file" do
  #   #   visit admin_catalogo_url
  #   #   click_on("Esporta catalogo CSV")
  #   #   wait_for_download
  #   #   expect(downloads.length).to eq(1)
  #   #   expect(download).to match(/.*\.csv/)
  #   # end
  # end
end
