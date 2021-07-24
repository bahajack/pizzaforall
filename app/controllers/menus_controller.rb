class MenusController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def show

  end

  def new
    @menu = Menu.new
  end

  #def create
    #@order = current_customer.orders.new(order_params)
    #@order = Order.new(order_params)
    #@order.save
    #redirect_to @order
  #end

  def create
          @menu = Menu.new(menu_params)
          if @menu.save
          flash.notice = "The menu record was created successfully."
          redirect_to @menu
          else
          flash.now.alert = @menu.errors.full_messages.to_sentence
          render :new
          end
  end

  def edit

  end

  #def update

  #  @order.update(order_params)
  #  redirect_to @order
  #end

  def update
          if @menu.update(menu_params)
          flash.notice = "The menu record was updated successfully."
          redirect_to @menu
          else
          flash.now.alert = @menu.errors.full_messages.to_sentence
          render :edit
          end
  end

  #def destroy

  #    @menu.destroy
  #    redirect_to menus_path
  #end

  def destroy
          @menu.destroy
          respond_to do |format|
          format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
          format.json { head :no_content }
          end
  end

  private

    def menu_params
      params.require(:menu).permit(:menu_name, :menu_type, :size, :price, :menu_id, :slug)
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to menus_path
    end
end
