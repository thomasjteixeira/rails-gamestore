# frozen_string_literal: true

module Admin::V1
  class CategoriesController < ApiController
    def index
      @categories = Category.all
    end

    def create
      @category = Category.new(category_params)
      save_category!
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def save_category!
      @category.save!
      render :show
    rescue StandardError
      render json: { errors: @category.errors.messages }, status: :unprocessable_entity
      # render_error(fields: @category.errors.messages)
    end
  end
end
