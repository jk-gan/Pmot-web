module API
  module V1
    class Device < Grape::API
      version 'v1'
      format :json

      resource :devices do
        params do
          requires :token, type: String, desc: "Access token."
          requires :gcm_token, type: String, desc: "GCM access token."
          requires :platform, type: String, desc: "Platform."
        end
        post do
          authenticate!
          @device = ::Device.create(user_id: current_user.id, token: params[:gcm_token], platform: params[:platform])
          # present @device, with: WellWithMe::Entities::Device
          @notification = Notification.new(title: "TEST", message: "Notification !!!!!!")
          # logger.error(@notification.message)
          # logger.error(@notification.title)
          # respond_to do |format|
            if @notification.save
              gcm = GCM.new('AIzaSyBkzGqh8gEHyKoTVjkt2TjJbi4uOmO8-1g')
              options = { data: { title: @notification.title, message: @notification.message}, collapse_key: 'updated_score' }
              # registration_ids = ['9']
              registration_ids = ::Device.all.pluck(:token)
              response = gcm.send(registration_ids, options)
              # format.html { redirect_to root_path, notice: 'Message was successfully pushed.' }
              # format.json { render action: 'show', status: :created, location: @notification }
            else
              # format.html { render action: 'new' }
              # format.json { render json: @notification.errors, status: :unprocessable_entity }
            end
          # end

          # Here we will send the notification to GCM using 'gcm' gem

        end
      end

    end
  end
end
