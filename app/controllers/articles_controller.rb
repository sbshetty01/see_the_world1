class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		article = Article.new(sanitized_params(params))
		article.save
		redirect_to article
	end

	def show
		@article = Article.find(params[:id])
	end

	def index

	end

	def search
		query = params['query']

		@results = [
			{ name: 'abc1', value: 'abc1 value' },
			{ name: 'abc2', value: 'abc2 value' },
			{ name: 'abc3', value: 'abc3 value' },
			{ name: 'abc4', value: 'abc4 value' },
			{ name: 'abc5', value: 'abc5 value' },
			{ name: 'abc6', value: 'abc6 value' }
		]

		render :index
	end

	private

	def sanitized_params(params)
		params.require(:article).permit(:title, :text)
	end
end
