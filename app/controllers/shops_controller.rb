class ShopsController < ApplicationController
  before_action :load_shop, except: [:index]
  def index
    @shops = Shop.all
  end

  def new
    if current_user.nil? or !current_user.admin
      redirect_to root_path
    else
      @shop = Shop.new
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
    params.require(:shop).permit(:name, :machine, :roaster, :multi, :drip, :btc, :ppc, :city, :state, :image)
  end
end
