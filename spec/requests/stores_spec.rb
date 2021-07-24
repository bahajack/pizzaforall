# require 'rails_helper'
#
# RSpec.describe "Stores", type: :request do
#   describe "GET /stores" do
#     it "works! (now write some real specs)" do
#       get stores_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
require "rails_helper"

RSpec.describe "Stores", type: :request do
  describe "get stores_path" do
    it "renders the index view" do
      FactoryBot.create_list(:store, 10)
      get stores_path
      expect(response).to render_template(:index)
    end
  end

  describe "get store_path" do
    it "renders the :show template" do
      store = FactoryBot.create(:store)
      get store_path(id: store.id)
      expect(response).to render_template(:show)
    end

    it "redirects to the index path if the store id is invalid" do
      get store_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to stores_path
    end
  end

  describe "get new_store_path" do
    it "renders the :new template" do
      get new_store_path
      expect(response).to render_template(:new)
    end
  end

  describe "get edit_store_path" do
    it "renders the :edit template" do
      store = FactoryBot.create(:store)
      get edit_store_path(store.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "post stores_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      menu = FactoryBot.create(:menu)
      store_attributes = FactoryBot.attributes_for(:store, menu_id: menu.id)
      expect {
        post stores_path, params: { store: store_attributes }
      }.to change(Store, :count)
      expect(response).to redirect_to store_path(id: Store.last.id)
    end
  end

  describe "post stores_path with invalid data" do
    it "does not save a new entry or redirect" do
      menu = FactoryBot.create(:menu)
      store_attributes = FactoryBot.attributes_for(:store, menu_id: menu.id)
      store_attributes.delete(:store_name)
      expect {
        post stores_path, params: { store: store_attributes }
      }.to_not change(Store, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put store_path with valid data" do
    it "updates an entry and redirects to the show path for the store" do
      store = FactoryBot.create(:store)
      put store_path(store.id), params: { store: { store_name: "Pizza Hut" } }
      store.reload
      expect(store.store_name).to eq("Pizza Hut")
      expect(response).to redirect_to store_path(store.id)
    end
  end

  describe "put store_path with invalid data" do
    it "does not update the store record or redirect" do
      store = FactoryBot.create(:store)
      put store_path(store.id), params: { store: { store_name: 11 } }
      store.reload
      expect(store.store_name).not_to eq(11)
      expect(response).to render_template(:edit)
    end
  end

  describe "delete a store record" do
    it "deletes a store record" do
      store = FactoryBot.create(:store)
      expect { delete store_path(store.id) }.to change(Store, :count)
      delete store_path(store.id)
      expect(response).to redirect_to stores_path
    end
  end
end
