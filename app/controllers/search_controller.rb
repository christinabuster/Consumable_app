class SearchController < ApplicationController

  def search_by
    @reviews = Review.all
  end

  def location
    @reviews = Review.where(postalcode: params[:postal])
  end

  def cuisine
    @reviews = Review.where(cuisine: params[:cuisine])
  end
  #
  def rating
    @reviews = Review.where(rating: params[:rating])
  end
  #
  # def price
  # end
  #

  #def new_search
  # if there's a cuisine param, put it into an instance variable and send the user to the page that shows the results
  # if there's a postal/location param, put it into an instance variable and send the user to the page that shows the results
  # if there's a price param, put it into an instance variable and sent the user to the page that shows the results
  # if there's a rating param, put it into an instance variable and send the user to the page that shows the results
  # ELSE, show all the reviews on the index page
#end

end
