class MoviesController < ApplicationController
  def index
    if params
      runtime_range = params[:runtime_in_minutes]
      case runtime_range
      when '1'
        min = 0
        max = 89
      when '2'
        min = 90
        max = 119
      when '3'
        min = 120
        max = 1000
      end
      @movies = Movie.where("title LIKE ? AND director LIKE ? AND runtime_in_minutes BETWEEN ? AND ? ", "%#{params[:title]}%", "%#{params[:director]}%", min, max)
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
