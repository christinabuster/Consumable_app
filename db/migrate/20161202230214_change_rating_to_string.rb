class ChangeRatingToString < ActiveRecord::Migration
  def change
    change_column(:reviews, :rating, :string)
  end
end
