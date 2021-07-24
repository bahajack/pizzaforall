class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def index
        @customers = Customer.all
    end

    def show

    end

    def new
      @customer = Customer.new
    end

     def create
       @customer = Customer.new(customer_params)
       if @customer.save
        flash.notice = "The customer record was created successfully."
        redirect_to @customer
       else
        flash.now.alert = @customer.errors.full_messages.to_sentence
        render :new
       end
    #   @customer = Customer.new(customer_params)
    #   @customer.save
    #   redirect_to @customer
     end
   

    def edit

    end

     def update
       if @customer.update(customer_params)
        flash.notice = "The customer record was updated successfully."
        redirect_to @customer
       else
        flash.now.alert = @customer.errors.full_messages.to_sentence
        render :edit
       end
    #   @customer.update(customer_params)
    #   redirect_to @customer
     end

    def destroy

        @customer.destroy
        redirect_to customers_path
    end

    private

      def customer_params
        params.require(:customer).permit(:name, :phone, :address,  :slug)
      end

      def set_customer
        @customer = Customer.find(params[:id])
      end
end
