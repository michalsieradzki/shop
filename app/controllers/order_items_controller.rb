class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit destroy ]
  before_action :load_order, only: [:create]
  before_action :authenticate_user!

  def index
    @order_items = OrderItem.all
  end
  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    
    @order_item = @order.order_items.find_or_create_by(product_id: params[:product_id])

    @order_item.update(quantity: @order_item.quantity+1)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: "Produkt pomyślnie dodany do koszyka." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
        @order_item = OrderItem.find(params[:id])

      if params[:order_item][:quantity].to_i == 0
        @order_item.destroy
        format.html { redirect_to order_path(@order_item.order_id), notice: "Produkt usunięty z koszyka" }

      elsif @order_item.update(order_item_params)
        format.html { redirect_to order_url(@order_item.order_id), notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
   
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
        @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end

    def load_order
      @order = Order.where(user_id: current_user.id).first_or_create(status: 'unsubmitted')   
      
          session[:order_id] = @order.id

    
    end
end
