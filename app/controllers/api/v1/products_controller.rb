class Api::V1::ProductsController < ApplicationController
    
    before_action :authenticate_user!, except: [:index]
    def index
        @products = [
            {
                'name': 'product 1',
                'description': 'Description product 1',
                'price': 12
            },
            {
                'name': 'product 2',
                'description': 'Description product 2',
                'price': 50
            }
        ]

        render json: @products
    end

    def create
      
    end
end
