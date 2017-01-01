require 'external_sites'

class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all

    render json: @pages
  end

  # GET /pages/1
  def show
    render json: @page
  end

  # POST /pages
  def create
    url = page_params[:url]

    tags_data = ExternalSites.extract_tags_data(url)

    body = { url: url }
    saved_page = Page.save_page_and_content(body, tags_data)
    if saved_page
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end

    # @page = Page.new(page_params)

    # if @page.save
      # render json: @page, status: :created, location: @page
    # else
      # render json: @page.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:url)
    end
end
