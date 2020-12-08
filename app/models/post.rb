class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  # def category_ids=(category_ids)
  #   category_ids.each do |id|
  #     category = Category.find(id.to_i) unless id.empty?
  #     self.categories << category
  #   end
  # end

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
end
