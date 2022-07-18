class Item < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :available, :category, :status, :available
  validates_numericality_of :amount

  enum status: {
    'Give' => 0,
    'Borrow' =>	1,
    'Trade' => 2
  }

  enum category: {
    'Sewing/Knitting' => 0,
    'Paper' =>	1,
    'Jewelry' => 2,
    'Baking' => 3,
    'Scrapbook/Floral' => 4,
    'Painting' => 5,
    'Drawing' => 6,
    'Wood Working' => 7,
    'Pottery' => 8,
    'Other' => 9
  }

  enum available: {
    'false' => 0,
    'true' => 1
  }
end
