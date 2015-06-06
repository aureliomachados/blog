class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create

		#create new article and populate with the values that are passed from form.
		@article = Article.new(article_params)

		#save the article
		if @article.save 	
			#and... redirect
		    redirect_to @article
		else
			render 'new'  
		end 
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'	
		end	
	end

	def destroy
		@article = Article.find(params[:id])

		@article.destroy

		redirect_to articles_path
	end


	#private methos

	private
		def article_params
			params[:article].permit(:title, :text)
		end
end
