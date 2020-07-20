class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id').where("categories.title = :category", category: category).order(id: :desc).pluck(:title)
  end
end
