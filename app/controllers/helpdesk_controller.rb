class HelpdeskController < ApplicationController
  before_action :set_customer

  def index
    @utterances = [
      "consultar tu saldo en puntos Scotiabank",
      "consultar el catálogo",
      "redimir tus puntos"
    ]
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
