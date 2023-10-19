require 'uri'
require 'net/http'


module GraphqlService
  class << self
    def create(**user_params)
      query =
      <<~QUERY
        mutation {
            userCreate(input: {
              userInput: {
                name: "#{user_params[:name]}",
                password: "#{user_params[:password]}",
                email: "#{user_params[:email]}",
                roleId: 1,
              }
            }) {
                clientMutationId
               }
        }
      QUERY

      uri = URI('http://127.0.0.1:3000/graphql')
      res = Net::HTTP.post_form(uri, query: query, operationName: "IntrospectionQuery")
      puts res.body  if res.is_a?(Net::HTTPSuccess)
    end

    def update(**user_params)
      user_inputs = set_user_inputs(**user_params)
      query =
      <<~QUERY
        mutation {
            userUpdate(input: {
              id: #{user_params[:id].to_s},
              userInput: {
                #{user_inputs},
                roleId: #{::Role.find_by_name(::Role::EMPLOYEE).id},
              }
            } ) {
              clientMutationId
          }
        }
      QUERY

      uri = URI('http://127.0.0.1:3000/graphql')
      res = Net::HTTP.post_form(uri, query: query, operationName: "IntrospectionQuery")
      puts res.body  if res.is_a?(Net::HTTPSuccess)
    end

    def fetch(id:)
      query = <<~Q
        {
          user(id: #{id}) {
            name
            email
          }
        }
      Q
      uri = URI('http://127.0.0.1:3000/graphql')
      res = Net::HTTP.post_form(uri, query: query, operationName: "IntrospectionQuery")
      puts res.body  if res.is_a?(Net::HTTPSuccess)
    end

    private

    def set_user_inputs(**user_params)
      user_inputs = ""

      [:name, :password, :email].each do |attri|
        user_inputs += "#{attri.to_s}: \"#{user_params[attri]}\"\n" if user_params[attri].present?
      end
      user_inputs
    end
  end
end
