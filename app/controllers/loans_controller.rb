class LoansController < ApplicationController

  def create
    item = DressingItem.find(params[:dressing_item_id])
    loan_hash = { user_id: current_user.id, dressing_item_id: item.id, status: "Pending" }
    @loan = Loan.new(loan_hash)
    if @loan.save
      if current_user.shopping_cart.nil?
        shopping_cart = ShoppingCart.new
        shopping_cart.user = current_user
        shopping_cart.save
      else
        shopping_cart = current_user.shopping_cart
      end
      redirect_to shopping_cart_path(shopping_cart)
    else
      respond_to do |format|
        format.html { redirect_to dressing_item_path(item) }
        format.js  # <-- will render `app/views/loans/create.js.erb`
      end
    end
  end

  def update
    @loan = Loan.find(params[:id])
    response = params[:answer]
    if response == "accept"
      @loan.status = "Current"
    elsif response == "reject"
      @loan.status = "Rejected"
    elsif response == "given-back"
      @loan.status = "Past"
    end
    if @loan.save
      redirect_to dashboard_user_path(current_user)
    else
      respond_to do |format|
        format.html { redirect_to dashboard_user_path(current_user) }
        format.js  # <-- will render `app/views/loans/update.js.erb`
      end
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to shopping_cart_path(current_user.shopping_cart) }
      format.js  # <-- will render `app/views/shopping_cart_items/destroy.js.erb`
    end
  end
end
