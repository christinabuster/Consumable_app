class SearchController < ApplicationController

  def search_by
    @reviews = Review.all
  end

  def location
    @reviews = Review.where(postalcode: params[:postal])
  end

  # def cuisine
  # end
  #
  # def rating
  # end
  #
  # def price
  # end
  #
  # def location
  # end
end
