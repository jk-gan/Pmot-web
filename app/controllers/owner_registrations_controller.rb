class OwnerRegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation, :status, :role,
                                  shop_attributes: [:id, :owner_id, :name, :address, :image]
                                  )
  end

  def account_update_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation, :current_password, :status, :role,
                                  shop_attributes: [:id, :owner_id, :name, :address, :image]
                                  )
  end
end
