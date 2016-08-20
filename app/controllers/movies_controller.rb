class MoviesController < ApplicationController
  before_action :set_movie,only: [:show,:edit,:update,:destroy]
  def index
    @movies=Movie.all.order(:title)
  end

  def show

  end

  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.new(movie_params)
    if @movie.save 
       redirect_to  @movie,notice: "sucessufully created movie"
     else
      render :new
    end
  end

  def edit
  end

  def update
   if @movie.update(movie_params)
   redirect_to  @movie,notice: "sucessufully updated movie"
 else 
  render :edit
end


  end

  def destroy
    @movie.destroy
  end

  private
  def set_movie
   @movie=Movie.find(params[:id])
  end

  def movie_params
  params.require(:movie).permit(:title,:description,:movie_length,:director,:rating)  
  end
end
