# frozen_string_literal: true

class User < ApplicationRecord
  def level_tests(level)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id ').where(level: level).pluck(:title)
  end
end
