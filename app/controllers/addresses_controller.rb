class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_addresses_blank?, only: [:index]

  def index
    @default_address = Address.find_by(addr_default: true)
    @addresses = Address.where(addr_default: false)

    @default_address = @default_address.decorate if @default_address.present?
    @addresses = @addresses.decorate if @addresses.present?
  end

  def new
    @address = Address.new.decorate
  end

  def create
    @address = Address.new
    @address = set_address_param(@address)

    if @address.save
      redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id]).decorate
  end

  def update
    @address = Address.find(params[:id])
    @address = set_address_param(@address)

    if @address.save
      redirect_to addresses_path
    end
  end

  def destroy
  end

  private
  def check_addresses_blank?
    redirect_to new_address_path unless Address.all.present?
  end

  def set_address_param(address)
    name = params[:address][:first_name] + " " + params[:address][:last_name]
    contact_address = params[:address][:hamlet] + ", " + params[:address][:village] + ", " + params[:address][:district] + ", " + params[:address][:province]
    address.contact_phone = params[:address][:contact_phone]
    address.contact_address = contact_address
    address.user_id = current_user.id
    address.name = name

    if ActiveModel::Type::Boolean.new.cast(params[:address][:addr_default])
      if check_action_create && Address.all.present?
        Address.update_all(addr_default: false)
      elsif check_action_update
        Address.update_all(addr_default: false)
      end
      address.addr_default = true
    end

    address
  end

  def check_action_create
    params[:action].include?("create")
  end

  def check_action_update
    params[:action].include?("update")
  end

end