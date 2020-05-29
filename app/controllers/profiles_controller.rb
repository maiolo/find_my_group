class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = policy_scope(Profile).where.not(id: current_user.profile.id)
    @user_interaction = UserInteraction.new
  end

  def new
    @profile = Profile.new
    @user = current_user
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    set_profile
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def profile_params
    params.require(:profile).permit(:nickname, :first_name, :last_name, :description, :gender, :favorite_role, :country, :state, :city, :photo)
  end
end
