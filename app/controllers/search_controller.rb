class SearchController < ApplicationController


  def search_by
    @review = Review.find_by_rating(params[:rating])
    # render "review
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
