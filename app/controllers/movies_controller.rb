class MoviesController < ApplicationController
  def index
    @movie = Movie.new
    if params[:query] || params[:runtime_in_minutes]

      min = params[:runtime_in_minutes].split('_').first
      max = params[:runtime_in_minutes].split('_').last
      @movies = Movie.title_or_director_search(params[:query]).runtime_search(min, max)

    else 
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    redirect_to movies_path

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
