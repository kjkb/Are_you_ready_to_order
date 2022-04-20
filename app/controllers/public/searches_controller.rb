class Public::SearchesController < ApplicationController
  def search
    @range =params[:peko]
    # binding.pry
    if @range == "ちょいペコ"
     @maps = Map.where(peko: "ちょいペコ")
    elsif @range == "ペコ"
     @maps = Map.where(peko: "ペコ")
    elsif @range == "ペコMAX"
     @maps = Map.where(peko: "ペコMAX")
    else
     @maps = Map.all
    end
  end
end
