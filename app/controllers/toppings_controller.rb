class ToppingsController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
      before_action :set_topping, only: [:show, :edit, :update, :destroy]

      def index
        @toppings = Topping.all
      end

      def show

      end

      def new
        @topping = Topping.new
      end

      #def create
        #@order = current_customer.orders.new(order_params)
        #@order = Order.new(order_params)
        #@order.save
        #redirect_to @order
      #end

      def create
              @topping = Topping.new(topping_params)
              if @topping.save
              flash.notice = "The topping record was created successfully."
              redirect_to @topping
              else
              flash.now.alert = @topping.errors.full_messages.to_sentence
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
              if @topping.update(topping_params)
              flash.notice = "The topping record was updated successfully."
              redirect_to @topping
              else
              flash.now.alert = @topping.errors.full_messages.to_sentence
              render :edit
              end
      end

      #def destroy

          #@order.destroy
        #  redirect_to orders_path
      #end

      def destroy
              @topping.destroy
              respond_to do |format|
              format.html { redirect_to toppings_url, notice: 'Topping was successfully destroyed.' }
              format.json { head :no_content }
              end
      end

      private

        def topping_params
          params.require(:topping).permit(:topping_name, :topping_price, :menu_id, :customer_id, :slug)
        end

        def set_topping
          @topping = Topping.find(params[:id])
        end

        def catch_not_found(e)
          Rails.logger.debug("We had a not found exception.")
          flash.alert = e.to_s
          redirect_to toppings_path
        end
    end
