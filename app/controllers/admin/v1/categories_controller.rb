# frozen_string_literal: true

module Admin::V1
  class CategoriesController < ApiController
    before_action :set_category, only: %i[update destroy]

    def index
      @categories = Category.all
    end

    def create
      @category = Category.new(category_params)
      save_category!
    end

    def update
      @category.attributes = category_params
      save_category!
    end

    def destroy
      @category.destroy!
    rescue ActiveRecord::RecordNotDestroyed
      render_error({ errors: @category.errors.messages })
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

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
