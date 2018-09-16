class Watson::Assistant
  include ActiveModel::Model

  attr_accessor :name, :data

  VERSION = "alpha"
  NAME = "TestFAQ"
  LAMBDA_FUNCTION_NAME = "TestFAQFunction"

  def self.current
  end
end
