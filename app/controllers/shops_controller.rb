class ShopsController < ApplicationController
  def edit
    @shop = current_owner.shop
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      @shop.owner.update(status: 1) if @shop.owner.inactive?
      flash[:success] = "#{@shop.name} updated."
      redirect_to root_path
    else
      render 'edit', error: "#{@shop.name} update failed."
    end
  end

  protected
  def shop_params
    params.require(:shop).permit(:id, :owner_id, :name, :address, :image, :description)
  end
end
