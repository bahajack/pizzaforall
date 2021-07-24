class StoresController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_store, only: [:show, :edit, :update, :destroy]

    def index
      @stores = Store.all
    end

    def show

    end

    def new
      @store = Store.new
    end

    #def create
      #@order = current_customer.orders.new(order_params)
      #@order = Order.new(order_params)
      #@order.save
      #redirect_to @order
    #end

    def create
            @store = Store.new(store_params)
            if @store.save
            flash.notice = "The store record was created successfully."
            redirect_to @store
            else
            flash.now.alert = @store.errors.full_messages.to_sentence
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
            if @store.update(store_params)
            flash.notice = "The store record was updated successfully."
            redirect_to @store
            else
            flash.now.alert = @store.errors.full_messages.to_sentence
            render :edit
            end
    end

    #def destroy

        #@order.destroy
      #  redirect_to orders_path
    #end

    def destroy
            @store.destroy
            respond_to do |format|
            format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
            format.json { head :no_content }
            end
    end

    private

      def store_params
        params.require(:store).permit(:store_name, :store_address, :order_type, :menu_id, :store_id, :customer_id, :slug)
      end

      def set_store
        @store = Store.find(params[:id])
      end

      def catch_not_found(e)
        Rails.logger.debug("We had a not found exception.")
        flash.alert = e.to_s
        redirect_to stores_path
      end
  end
