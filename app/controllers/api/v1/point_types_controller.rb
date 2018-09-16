class Api::V1::PointTypesController < ApplicationController
  def index
    @point_types = PointType.all
    render json: @point_types
  end
end
