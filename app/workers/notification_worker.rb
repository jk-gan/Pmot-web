class NotificationWorker
  include Sidekiq::Worker
  def perform(promotion_id, owner_id)
    promotion = Promotion.find(promotion_id)
    owner = Owner.find(owner_id)
    @notification = Notification.new(title: "#{owner.shop.name}", message: "#{promotion.name}")
    if @notification.save
      gcm = GCM.new('AIzaSyBkzGqh8gEHyKoTVjkt2TjJbi4uOmO8-1g')
      options = { data: { title: @notification.title, message: @notification.message, promotion_id: promotion_id }, collapse_key: 'updated_score' }

      registration_ids = Device.where(user_id: owner.shop.users.pluck(:id)).pluck(:token)
      response = gcm.send(registration_ids, options)
    end
  end
end
