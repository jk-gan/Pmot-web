class NotificationsController < ApplicationController
  def create
    @notification = Notification.new(notification_params)
    logger.error(@notification.message)
    logger.error(@notification.title)
    respond_to do |format|
      if @notification.save
        # format.html { redirect_to root_path, notice: 'Message was successfully pushed.' }
        # format.json { render action: 'show', status: :created, location: @notification }
      else
        # format.html { render action: 'new' }
        # format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end

    # Here we will send the notification to GCM using 'gcm' gem
    gcm = GCM.new('AIzaSyBkzGqh8gEHyKoTVjkt2TjJbi4uOmO8-1g')
    options = { data: { title: @notification.title, message: @notification.message}, collapse_key: 'updated_score' }

    registration_ids = ['1']
    response = gcm.send(registration_ids, options)
  end

  private
  def notification_params
    params.require(:notification).permit(:title, :message)
  end
end
