class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list: @list)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.list = List.find(params[:list_id])

    if @bookmark.save
      redirect_to list_path(@bookmark.list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @bookmark.destroy
      redirect_to list_path(@bookmark.list)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
