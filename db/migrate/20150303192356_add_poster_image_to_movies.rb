class AddPosterImageToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster_img, :string
  end
end
