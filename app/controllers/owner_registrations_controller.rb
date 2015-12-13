class OwnerRegistrationsController < Devise::RegistrationsController

  def create
    @owner = Owner.new(sign_up_params)
    @owner.create_shop
    if @owner.save
      redirect_to root_path
    else
      redirect_to new_owner_session_path
    end
  end

  private

  def sign_up_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation, :status, :role,
                                  shop_attributes: [:id, :owner_id, :name, :address, :image, :description]
                                  )
  end

  def account_update_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation, :current_password, :status, :role,
                                  shop_attributes: [:id, :owner_id, :name, :address, :image, :description]
                                  )
  end
end
