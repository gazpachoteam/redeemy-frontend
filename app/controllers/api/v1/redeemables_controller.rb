class Api::V1::RedeemablesController < ApplicationController

  def index
    @redeemables = Redeemable.all
    render json: @redeemables
  end

  def show
    @redeemable = Redeemable.find(params[:id])
    render json: @redeemable
  end

  def create
    @provider = Provider.find_by_id(params[:provider_id])
    unless @provider
      @provider = Provider.create(id: params[:provider_id], name: params[:provider_name])
    end

    @redeemable = @provider.redeemables.build(redeemable_params)
      if @redeemable.save
        render json: {message: 'Redeemable Saved'}, status: 200
      else
        render json: {errors: @redeemable.errors.full_messages}, status: 400
      end
  end

  def update
    @redeemable = Redeemable.find(params[:id])
    if @redeemable.update(redeemable_params)
      render json: @redeemable, status: 200
    else
      render json: { errors: @redeemable.errors.full_messages}, status: 400
    end
  end

  def destroy
    @redeemable = Redeemable.find(params[:id])
    if @redeemable.destroy
      render json: {message: 'Redeemable Deleted'}, status: 200
    else
      render json: { errors: @redeemable.errors.full_messages}, status: 400
    end
  end

  private

  def redeemable_params
    params.permit(:name, :description, :category, :expiration)
  end

end
