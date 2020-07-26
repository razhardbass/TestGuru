class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
                    
  scope :with_easy_level, -> { where(level: 0..1) }
  scope :with_medium_level, -> { where(level: 2..4) }
  scope :with_hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title) }
  scope :level_tests, -> (level) { where(tests: {level: level}) }
end
