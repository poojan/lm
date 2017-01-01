class Page < ApplicationRecord
  has_many :contents, :dependent => :delete_all
end
