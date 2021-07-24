# require 'rails_helper'
#
# RSpec.describe "Toppings", type: :request do
#   describe "GET /toppings" do
#     it "works! (now write some real specs)" do
#       get toppings_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
require "rails_helper"

RSpec.describe "Toppings", type: :request do
  describe "get toppings_path" do
    it "renders the index view" do
      FactoryBot.create_list(:topping, 10)
      get toppings_path
      expect(response).to render_template(:index)
    end
  end

  describe "get topping_path" do
    it "renders the :show template" do
      topping = FactoryBot.create(:topping)
      get topping_path(id: topping.id)
      expect(response).to render_template(:show)
    end

    it "redirects to the index path if the topping id is invalid" do
      get topping_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to toppings_path
    end
  end

  describe "get new_topping_path" do
    it "renders the :new template" do
      get new_topping_path
      expect(response).to render_template(:new)
    end
  end

  describe "get edit_topping_path" do
    it "renders the :edit template" do
      topping = FactoryBot.create(:topping)
      get edit_topping_path(topping.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "post toppings_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      menu = FactoryBot.create(:menu)
      topping_attributes = FactoryBot.attributes_for(:topping, menu_id: menu.id)
      expect {
        post toppings_path, params: { topping: topping_attributes }
      }.to change(Topping, :count)
      expect(response).to redirect_to topping_path(id: Topping.last.id)
    end
  end

  describe "post toppings_path with invalid data" do
    it "does not save a new entry or redirect" do
      menu = FactoryBot.create(:menu)
      topping_attributes = FactoryBot.attributes_for(:topping, menu_id: menu.id)
      topping_attributes.delete(:topping_name)
      expect {
        post toppings_path, params: { topping: topping_attributes }
      }.to_not change(Topping, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put topping_path with valid data" do
    it "updates an entry and redirects to the show path for the topping" do
      topping = FactoryBot.create(:topping)
      put topping_path(topping.id), params: { topping: { topping_price: 13 } }
      topping.reload
      expect(topping.topping_price).to eq(13)
      expect(response).to redirect_to topping_path(topping.id)
    end
  end

  describe "put topping_path with invalid data" do
    it "does not update the topping record or redirect" do
      topping = FactoryBot.create(:topping)
      put topping_path(topping.id), params: { topping: { topping_price: "aaa" } }
      topping.reload
      expect(topping.topping_price).not_to eq("aaa")
      expect(response).to render_template(:edit)
    end
  end

  describe "delete a topping record" do
    it "deletes a topping record" do
      topping = FactoryBot.create(:topping)
      expect { delete topping_path(topping.id) }.to change(Topping, :count)
      delete topping_path(topping.id)
      expect(response).to redirect_to toppings_path
    end
  end
end
