class HomeController < ApplicationController
  def index
    @regions = Region.all
  end
end
