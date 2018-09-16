class PagesController < ApplicationController
  def catalog
    @redeemables = Redeemable.all
  end
end
