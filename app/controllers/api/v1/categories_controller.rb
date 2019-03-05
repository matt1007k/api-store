class Api::V1::CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :update, :destroy]
  
    def index
      @categories = Category.order(:created_at)
      render json: @categories, status: :ok
    end

    def show
      render json: {
        category: @category, 
        status: :ok
      }.to_json
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        render json: {
          category: @category, 
          status: :created,
          message: 'Successfully created'
        }.to_json
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def update
      if @category.save
        render json: {
          category: @category, 
          status: :created,
          message: 'Successfully updated'
        }.to_json
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    private
      def find_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :description)
      end
end
