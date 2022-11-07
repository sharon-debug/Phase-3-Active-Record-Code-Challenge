class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        self.products.order('star_rating').last #returns the product instance
        ##self.products.maximum('star_rating') returns the highest rating only e.g 8
    end

    def remove_reviews(product)
        self.reviews.where(product: product).destroy_all
    end
end