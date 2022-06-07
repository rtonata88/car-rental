require 'swagger_helper'

RSpec.describe 'users' do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[username password]
      }

      response '201', 'User created' do
        let(:user) { { username: 'user1', password: '123@123' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: 'foo' } }
        run_test!
      end
    end
  end
end
