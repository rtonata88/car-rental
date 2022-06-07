require 'swagger_helper'

RSpec.describe 'favorites' do
    path '/users/1/favorites' do
    post 'Creates a favorite' do
      tags 'Favorites'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      security [ApiKeyAuth: []]

      parameter name: :favorite, in: :body, type: :string, schema: {
        type: :object,
        properties: {
          car_id: { type: :integer }
        },
        required: ['car_id']
      }

      response '201', 'favorite created' do
        let(:favorite) do
          { id:1, car_id: 1, user_id: 1}
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:favorite) { 'Bad Request!!' }
        run_test!
      end
    end
  end
end
