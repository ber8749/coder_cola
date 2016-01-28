require 'pusher_wrapper'
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:push_example]
  before_action :verify_admin, except: [:create, :push_example]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = Product.all
  end

  # GET /orders/1/edit
  def edit
    @products = Product.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params.merge(user_id: current_user.id, status: Order::SHIPPED))

    respond_to do |format|
      if @order.save
        push_order_created
        format.html { redirect_to home_pages_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render 'pages/home' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def push_example
    set_coder_cola
    PusherWrapper.push_order_examples(@coder_cola.sold, @coder_cola.shipped)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :status, line_items_attributes: [:product_id, :quantity])
  end

  def push_order_created
    set_coder_cola
    Pusher.trigger("coder_cola_#{Rails.env}", 'order_created',
                    first_name: @order.user.first_name,
                    city: @order.shipping_address.city,
                    country: @order.shipping_address.country,
                    quantity: @order.total_quantity,
                    sold: @coder_cola.sold,
                    shipped: @coder_cola.shipped
                  )
  end
end
