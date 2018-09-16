class Watson::Assistant
  include ActiveModel::Model

  attr_accessor :name, :data

  VERSION = "alpha"
  NAME = "TestFAQ"
  LAMBDA_FUNCTION_NAME = "TestFAQFunction"
=begin
  CLIENT = Aws::LexModelBuildingService::Client.new(region: ENV["LEX_FAQ_AWS_REGION"],
    access_key_id: ENV["LEX_FAQ_AWS_ACCESS_ID"],
    secret_access_key: ENV["LEX_FAQ_AWS_SECRET_ACCESS_KEY"])
=end

  def self.current
=beging
    data = CLIENT.get_bot({
      name: Lex::Bot::NAME,
      version_or_alias: "$LATEST",
    })

    self.new(name: Lex::Bot::NAME, data: data)
=end
  end
end
