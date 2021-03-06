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
      NotificationWorker.perform_async(@promotion.id, current_owner.id)
      # @notification = Notification.create(title: "#{current_owner.shop.name}", message: "#{@promotion.name}")
      # gcm = GCM.new('AIzaSyBkzGqh8gEHyKoTVjkt2TjJbi4uOmO8-1g')
      # options = { data: { title: @notification.title, message: @notification.message}, collapse_key: 'updated_score' }
      # registration_ids = Device.where(user_id: current_owner.shop.users.pluck(:id)).pluck(:token)
      # response = gcm.send(registration_ids, options)
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
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    redirect_to promotions_path
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :term_and_condition, :starts_at, :expires_at, :image)
  end
end
