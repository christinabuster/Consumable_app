class AddPaperclipToReviews < ActiveRecord::Migration
  def change
    add_attachment :reviews, :image
  end
end
