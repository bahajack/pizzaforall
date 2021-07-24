# require 'rails_helper'
#
# RSpec.describe "Menus", type: :request do
#   describe "GET /menus" do
#     it "works! (now write some real specs)" do
#       get menus_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
require "rails_helper"

RSpec.describe "Menus", type: :request do
  describe "get menus_path" do
    it "renders the index view" do
      FactoryBot.create_list(:menu, 10)
      get menus_path
      expect(response).to render_template(:index)
    end
  end

  describe "get menu_path" do
    it "renders the :show template" do
      menu = FactoryBot.create(:menu)
      get menu_path(id: menu.id)
      expect(response).to render_template(:show)
    end

    it "redirects to the index path if the menu id is invalid" do
      get menu_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to menus_path
    end
  end

  describe "get new_menu_path" do
    it "renders the :new template" do
      get new_menu_path
      expect(response).to render_template(:new)
    end
  end

  describe "get edit_menu_path" do
    it "renders the :edit template" do
      menu = FactoryBot.create(:menu)
      get edit_menu_path(menu.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "post menus_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order = FactoryBot.create(:order)
      menu_attributes = FactoryBot.attributes_for(:menu, order_id: order.id)
      expect {
        post menus_path, params: { menu: menu_attributes }
      }.to change(Menu, :count)
      expect(response).to redirect_to menu_path(id: Menu.last.id)
    end
  end

  describe "post menus_path with invalid data" do
    it "does not save a new entry or redirect" do
      order = FactoryBot.create(:order)
      menu_attributes = FactoryBot.attributes_for(:menu, order_id: order.id)
      menu_attributes.delete(:menu_name)
      expect {
        post menus_path, params: { menu: menu_attributes }
      }.to_not change(Menu, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put menu_path with valid data" do
    it "updates an entry and redirects to the show path for the menu" do
      menu = FactoryBot.create(:menu)
      put menu_path(menu.id), params: { menu: { price: 13 } }
      menu.reload
      expect(menu.price).to eq(13)
      expect(response).to redirect_to menu_path(menu.id)
    end
  end

  describe "put menu_path with invalid data" do
    it "does not update the menu record or redirect" do
      menu = FactoryBot.create(:menu)
      put menu_path(menu.id), params: { menu: { price: "aaa" } }
      menu.reload
      expect(menu.price).not_to eq("aaa")
      expect(response).to render_template(:edit)
    end
  end

  describe "delete a menu record" do
    it "deletes a menu record" do
      menu = FactoryBot.create(:menu)
      expect { delete menu_path(menu.id) }.to change(Menu, :count)
      delete menu_path(menu.id)
      expect(response).to redirect_to menus_path
    end
  end
end
