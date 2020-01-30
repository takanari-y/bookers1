class BooksController < ApplicationController

  	def top
    end
 	def index
  		@books= Book.all
  		@book= Book.new
	end

	def show
		@book= Book.find(params[:id])
	end


	def edit
		@book= Book.find(params[:id])
	end

	def update
		@book=Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]="Book was successfully update."
		redirect_to book_path(@book.id)
		else
			render action: :edit
		end
	end


	def create
		@book=Book.new(book_params)
		@books= Book.all
		if @book.save
			flash[:notice]="Book was successfully created."
		redirect_to book_path(@book.id)
		else
			render action: :index
		end
	end

	def destroy
		book=Book.find(params[:id])
		if book.destroy
			flash[:notice]="Book was successfully destroyed."
		redirect_to books_path
		else
			render action: :destroy
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :category, :body)
	end
end

