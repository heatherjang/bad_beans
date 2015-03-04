class MoviesController < ApplicationController
  def index
    if params[:title] || params[:director] || params[:runtime_in_minutes]
        case params[:runtime_in_minutes]
        when '1'
          min = 0
          max = 89
        when '2'
          min = 90
          max = 119
        when '3'
          min = 120
          max = 1000
        else
          min = 0
          max = 1000
        end
      @movies = Movie.title_search(params[:title]).director_search(params[:director]).runtime_search(min, max)
    else 
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

    def movie_params
      params.require(:movie).permit(
        :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :poster_img, :remote_poster_img_url
        )
    end  

end
