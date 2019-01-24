class Api::V1::ProductsController < ApplicationController
    
    before_action :authenticate_user!, except: [:index]
    def index
        @products = [
            'name': 'product 1',
            'price': 12
        ]

        render json: @products
    end

    def create
      
    end
end
