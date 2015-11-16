class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.select(:name, :description).where(shop_id: current_owner.shop.id)
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = current_owner.shop.promotions.new(promotion_params)
    if @promotion.save
      redirect_to promotions_path
      flash[:notice] = "This promotion was successfully created"
    else
      render 'new', error: "Something was wrong, please submit again"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :term_and_condition, :starts_at, :expires_at)
  end
end
