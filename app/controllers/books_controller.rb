class BooksController < ApplicationController
    before_action :authenticate_user!
    def update
        @book = Book.find(params[:id])
        @books = Book.all
        @user = current_user
        @book.user_id = current_user.id
     if @book.update(book_params)
        redirect_to book_path(@book.id),notice:"successfully"
        else
        render :index
     end
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end
    end

    def create
        @books = Book.all
    	@book = Book.new(book_params)
        @user = current_user
        @book.user_id = current_user.id
    	if@book.save
    	redirect_to book_path(@book.id), notice: "successfully"
        else
        render :index
        end
    end

    def index
        @books =Book.all
        @book = Book.new
        @user = current_user
    end

    def show
    	@book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private

    def book_params
    	params.require(:book).permit(:title,:body,:user_id)
    end
end
