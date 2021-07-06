class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #layout 'customer_layout'

    def index
        @orders = Order.all
    end

    def show

    end

    def new
      @order = Order.new
    end

    #def create
      #@order = current_customer.orders.new(order_params)
      #@order = Order.new(order_params)
      #@order.save
      #redirect_to @order
    #end

    def create
            @order = Order.new(order_params)
            if @order.save
            flash.notice = "The order record was created successfully."
            redirect_to @order
            else
            flash.now.alert = @order.errors.full_messages.to_sentence
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
            if @order.update(order_params)
            flash.notice = "The order record was updated successfully."
            redirect_to @order
            else
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :edit
            end
    end

    #def destroy

        #@order.destroy
      #  redirect_to orders_path
    #end

    def destroy
            @order.destroy
            respond_to do |format|
            format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
            end
    end

    private

      def order_params
        params.require(:order).permit(:product_name, :product_count, :product_type, :customer_id, :slug)
      end

      def set_order
        @order = Order.find(params[:id])
      end

      def catch_not_found(e)
        Rails.logger.debug("We had a not found exception.")
        flash.alert = e.to_s
        redirect_to orders_path
      end
end
