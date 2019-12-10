# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # def after_sign_in_path_for(resource)
  #   describes_path
  # end
  #
  # def after_sign_out_path_for(resource)
  #   describes_path
  # end

  def my_page
    @user = User.find(params[:id])
  end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	  redirect_to my_page_path(id: current_user.id), notice: 'プロフィールを更新しました'
    else
      redirect_to my_page_path(id: current_user.id), flash: { error: current_user.errors.full_messages }
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  def after_update_path_for(resource)
    my_page_path(id: current_user.id)
  end

  def configure_account_update_params
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_image])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
