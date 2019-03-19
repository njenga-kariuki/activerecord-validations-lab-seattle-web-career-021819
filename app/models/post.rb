class Post < ActiveRecord::Base
  # validates_with PostTitleValidator
  # validates_with PostCategoryValidator

  validates :title, presence: true, length: {minimum: 0}
  validate :post_title
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  # def  validate_category
  #   self.category == 'Fiction' || self.category == 'Non-Fiction'
  # end

  def post_title
    if !self.title.nil?
      phrases = ["Won\'t Believe", "Secret", "Top", "Guess"]
      if !phrases.any? {|phrase| self.title.include?(phrase)}
        errors.add(:title, "Not enough!")
      end
    else
      errors.add(:title, "Not enough!")
    end
  end
end
