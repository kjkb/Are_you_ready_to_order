class Public::HomeController < ApplicationController
  def about
  end

  def top
    @maps = Map.all
  end
end
