# frozen_string_literal: true

class User < ApplicationRecord
  def level_tests(level)
    Test.joins('INNER JOIN test_passages ON test_passages.test_id = tests.id ').where(tests: {level: level},test_passages: {user_id: self.id} )
  end
end
