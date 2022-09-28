require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /catalogo" do
    it "returns successful response" do
      get catalogo_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /orto-dei-fiori" do
    it "returns successful response" do
      get ortodeifiori_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /contatti" do
    it "returns successful response" do
      get contatti_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /bonus-verde" do
    it "returns successful response" do
      get bonusverde_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /come-acquistare" do
    it "returns successful response" do
      get acquistare_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /abbonamento" do
    it "returns successful response" do
      get abbonamento_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /condizionivendita" do
    it "returns successful response" do
      get condizionivendita_url
      expect(response).to have_http_status(200)
    end
  end
end
