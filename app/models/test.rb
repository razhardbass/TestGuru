class Test < ApplicationRecord
  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id').where("categories.title = :category", category: category).order(id: :desc).pluck(:title)
  end
end
