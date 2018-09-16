class Api::V1::AnswersController < ApplicationController
  before_action :set_user

  def get
    assistant = AssistantV1.new(
      username: ENV["IBM_USERNAME"],
      password: ENV["IBM_PASSWORD"],
      version: "2017-04-21"
    )
=begin
    lex_client = Aws::Lex::Client.new(
                    region: ENV["LEX_FAQ_AWS_REGION"],
                    access_key_id: ENV["LEX_FAQ_AWS_ACCESS_ID"],
                    secret_access_key: ENV["LEX_FAQ_AWS_SECRET_ACCESS_KEY"])

    resp = lex_client.post_text({
      bot_name: Lex::Bot::NAME,
      bot_alias: Lex::Bot::VERSION,
      user_id: params[:user_id],
      session_attributes: {},
      input_text: params[:text]
    })
=end
  byebug
  context = params[:context] == "" ? {} : JSON.parse(params[:context])

  response = assistant.message(
    workspace_id: ENV["IBM_WORKSPACE_ID"],
    input: {
      "text" => params[:text]
    },
    context: context
  ).result
    render json: {
      answer: "#{@user.name}, respuesta + #{response["output"]["text"]}",
      dialog_action_type: "Close",
      context: response["context"],
      fulfillment_state: "Fulfilled",
      status: 200
      } and return

  rescue => e
    status = @answer.present? ? 500 : 404
    render json: {
      answer: "OH NO! Something went wrong: #{e.inspect}",
      fulfillment_state: 'Fulfilled',
      dialog_action_type: "Close",
      status: status
    } and return
  end

  private

  def set_user
    if params[:user_type] == "Provider"
      @user = Provider.find(params[:user_id])
    end
  end
end
