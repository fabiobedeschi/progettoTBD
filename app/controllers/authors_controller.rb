class AuthorsController < ApplicationController
  before_action :find_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all.order name: :asc
  end

  def show; end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'authors/new'
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render 'authors/edit'
    end
  end

  def destroy
    redirect_to authors_path if @author.destroy
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio, :dob, :dod)
  end

  def find_author
    @author = Author.find params[:id]
  end

end
