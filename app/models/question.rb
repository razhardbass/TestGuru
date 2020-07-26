class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_max_answers

  def validate_max_answers
    errors.add(:answers) if answers.size <= 1 || answers.size > 4 
  end

end
