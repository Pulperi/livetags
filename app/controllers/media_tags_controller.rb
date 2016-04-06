class MediaTagsController < ApplicationController
  before_action :set_media, only: [:edit, :update, :destroy]

  def new
    @media = MediaTag.new
  end

  def show
    user = User.find_by_name params[:id]
    if user
      @all_media = MediaTag.all.where(user_id: user.id)
      render 'index'
    else
      redirect_to root_path
    end
  end

  def index
    @all_media = MediaTag.all
  end

  def create
    @media = MediaTag.new(user_params)

    respond_to do |format|
      if @media.save
        format.html { redirect_to @media, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @media }
      else
        format.html { render action: 'new' }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def set_media
    @media = MediaTag.find(params[:id])
  end

  def user_params
    params.require(:media).permit(:user_id, :link_url)
  end

end