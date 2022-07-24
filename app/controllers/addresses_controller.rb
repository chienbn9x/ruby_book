class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @default_address = Address.find_by(addr_default: true).decorate
    @addresses = Address.where(addr_default: false).decorate
  end

  def new
    @address = Address.new
  end

  def create
    name = params[:first_name] + " " + params[:last_name]
    contact_address = params[:hamlet] + ", " + params[:village] + ", " + params[:district] + ", " + params[:province]
    @address = Address.new
    @address.contact_phone = params[:contact_phone]
    @address.contact_address = contact_address
    @address.user_id = current_user.id
    @address.name = name

    if ActiveModel::Type::Boolean.new.cast(params[:addr_default])
      Address.update_all(addr_default: false)
    else
      @address.addr_default = true if Address.where(addr_default: true).blank?
    end
    if @address.save
      redirect_to addresses_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

end