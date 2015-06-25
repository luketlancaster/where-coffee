class ShopsController < ApplicationController
  before_action :load_shop, except: [:index]
  def index
    if !params['/'].nil? and params["/"]["state"].present?
      #@shops = Shop.all
      @shops = Shop.all.state(params["/"]["state"])
    elsif params['lat'] and params['lon']
      @shops = Shop.near(["#{params['lat']}", "#{params['lon']}"], 20)
    else
      @shops = Shop.all
    end
  end

  def new
    if current_user.nil? or !current_user.admin
      redirect_to root_path
    else
      @shop = Shop.new
    end
  end

  def edit
    if current_user.present? and current_user.admin == false
      redirect_to root_path
    end
    if current_user.nil?
      redirect_to root_path
    end
  end

  def update
    if @shop.save
      flash.notice = "Thanks for the update!"
      redirect_to root_path
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end

  def create
    if @shop.save
      redirect_to root_path, notice: "Thank you!"
    else
      flash.alert = "Please fix the errors below to continue"
      render :new
    end
  end

  protected

  def load_shop
    if params[:id].present?
      @shop = Shop.find(params[:id])
    else
      @shop = Shop.new
    end
    if params[:shop].present?
      @shop.assign_attributes(shop_params)
    end
  end

  def shop_params
    params.require(:shop).permit(:name, :machine, :roaster, :multi, :drip, :btc, :ppc, :city, :state, :image, :address, :lat, :lon)
  end
end
