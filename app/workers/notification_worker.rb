class NotificationWorker
  include Sidekiq::Worker
  def perform(promotion_id)
    promotion = Promotion.find(promotion_id)
    @notification = Notification.new(title: "#{current_owner.shop.name}", message: "#{promotion.name}")
    gcm = GCM.new('AIzaSyBkzGqh8gEHyKoTVjkt2TjJbi4uOmO8-1g')
    options = { data: { title: @notification.title, message: @notification.message}, collapse_key: 'updated_score' }
    # registration_ids = ['9']
    registration_ids = Device.where(user_id: current_owner.shop.users.pluck(:id)).pluck(:token)
    response = gcm.send(registration_ids, options)
  end
end
