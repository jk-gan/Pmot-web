class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.select(:id, :name, :description, :term_and_condition, :starts_at, :expires_at).where(shop_id: current_owner.shop.id)
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = current_owner.shop.promotions.new(promotion_params)
    if @promotion.save
      NotificationWorker.perform_async(@promotion.id)
      
      redirect_to promotions_path
      flash[:notice] = "This promotion was successfully created"
    else
      render 'new', error: "Something w`as wrong, please submit again"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    redirect_to promotions_path
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :term_and_condition, :starts_at, :expires_at, :image)
  end
end
