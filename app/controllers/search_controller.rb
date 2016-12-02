class SearchController < ApplicationController


  def search_by
    @reviews = Review.all

  end

  def cuisine
  end

  def rating
    @reviews = Review.where(rating: params[:review_rating])
  end

  def price
    @reviews = Review.where(price: params[:price])
  end

  def location
  end
end
