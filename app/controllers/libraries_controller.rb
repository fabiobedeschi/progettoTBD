class LibrariesController < ApplicationController
  before_action :find_library, only: %i[show]
  before_action :user_library, only: %i[edit_authors edit_books update_authors update_books]

  def index
    @libraries = Library.ordered(params[:order], params[:ad])
  end

  def show; end

  def edit_authors; end

  def edit_books; end

  def update_authors
    update 'authors'
  end

  def update_books
    update 'books'
  end

  private

  def update(dest)
    if @library.update(library_params)
      @library.update_attribute(:updated_at, Time.now)
      redirect_to @library
    else
      redirect_to "libraries/edit_#{dest}"
    end
  end

  def library_params
    params.require(:library).permit(author_ids: [], book_ids: [])
  end

  def find_library
    @library = Library.find(params[:id])
  end

  def user_library
    @library = @user.library
  end
end
