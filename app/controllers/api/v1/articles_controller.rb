module Api
  module V1
    class ArticlesController < ApplicationController
     
                  def index
                      # Using Select Method
                      articles = Article.select(:id,:title,:content).order('created_at DESC')
                      # Created Array Of Hash
                      # article = []
                      # articles.collect do |d|
                      #   article << {"id"=>d.id,"title"=> d.title,"content"=> d.content}
                      # end
                    
                      render json: {
                          data: articles
                      },status: :ok
                  end
          
       
                 def show
                    article = Article.find(params[:id])
                    render json: {
                      status: "Success",
                      message: "Render Articles",
                      data:article
                    },status: :ok
                  end
                    # Created Articles
                  def create
                    article = Article.create(article_params)
                      if article.save
                        render json: {
                          status: "Success",
                          message: "Created Articles",
                          # data:article
                        },status: :ok
                      else
                        render json: {
                          status: "Failed",
                          message: "Not Saved Articles",
                          data:article.errors
                        },status: :unprocessable_entity
                      end

                  end

                  def destroy
                    article = Article.find(params[:id])
                    article.destroy
                    render json: {
                      status: "Success",
                      message: "Deleted Articles",
                      # data:article
                    },status: :ok
                  end


                  def update
                    article = Article.find(params[:id])
                      if article.update(article_params)
                        render json: {
                          status: "Success",
                          message: "Created Articles",
                          data:article
                        },status: :ok
                      else
                        render json: {
                          status: "Failed",
                          message: "Not Updates ",
                          data:article.errors
                        },status: :unprocessable_entity
                      end
                  end

        private
        def article_params
          params.require(:article).permit(:title,:content)
        end
    end
  end
end