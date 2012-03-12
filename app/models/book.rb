class Book < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true
  
  validates_with IsbnValidator
  
  has_many :reservations
  #make association with comments
  has_many :comments, :dependent => :destroy

  def reservation
    self.reservations.where(state: 'reserved').first
  end
  
  def self.search_by_isbn(value)
    self.where(isbn: value)
  end

  def self.search_by_authors(value)
    self.where("authors LIKE ?", "%#{value}%").order(
               "authors asc, created_at desc")
  end

  def self.search_by_title(value)
    self.where("title LIKE ?", "%#{value}%").order(
         "title asc, created_at desc")
  end


  
end
