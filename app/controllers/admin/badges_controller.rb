class Admin::BadgesController < ApplicationController
  before_action :find_badge, only: [:show, :edit, :update, :destroy]
  before_action :find_badges, only: [:index]
  before_action :authenticate_admin!

  def index
    @badge = Badge.first

  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_url(@badge)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_url(@badge)
      flash[:success] = "Badge успешно сохранен"
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :kind, :image)
  end

end
