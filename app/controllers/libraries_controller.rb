class LibrariesController < ApplicationController
  before_action :find_library, only: %i[show update]
  before_action :user_library, only: %i[edit_books]

  def show; end

  def edit_books; end

  def update
    if @library.update(library_params)
      redirect_to @library
    else
      redirect_to 'libraries/edit_books'
    end
  end

  private

  def library_params
    params.require(:library).permit(book_ids: [])
  end

  def find_library
    @library = Library.find(params[:id])
  end

  def user_library
    @library = @user.library
  end
end
