class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = ['G', 'PG', 'PG-13', 'R']
    @checked_hash = params[:ratings]
    if @checked_hash != nil
      checked_array = @checked_hash.keys
    else
      checked_array = @all_ratings
    end
    #debugger
    sorting_key = params[:sort_by]
    # @movies = Movie.all  # this was the old code
    if (sorting_key == "title")
     @movies = Movie.find(:all, :order => "title", :conditions => {:rating => checked_array})
    # debugger
    elsif (sorting_key == "release_date")
     @movies = Movie.find(:all, :order => "release_date", :conditions => {:rating => checked_array})
    elsif
      @movies = Movie.find(:all, :conditions => {:rating => checked_array})
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
