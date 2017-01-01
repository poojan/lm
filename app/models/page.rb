class Page < ApplicationRecord
  has_many :contents, :dependent => :delete_all

  def save_page_and_content(page_params, tags_data)
    Page.transaction do
      Content.transaction do
        @page = Page.new(page_params)
        @page.contents.new(tags_data)
        if @page.save
          @page.id
        elsif
          @page.errors
        end
      end
    end
  end
end
