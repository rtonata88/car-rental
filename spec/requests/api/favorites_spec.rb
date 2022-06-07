require 'swagger_helper'

RSpec.describe 'favorites' do
  path '/users/{user_id}/favorites' do
    post 'Creates a favorite' do
      tags 'Favorites'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      security [ApiKeyAuth: []]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :favorite, in: :body, type: :string, schema: {
        type: :object,
        properties: {
          car_id: { type: :integer }
        },
        required: ['car_id']
      }

      response '201', 'favorite created' do
        let(:favorite) do
          { id: 1, car_id: 1, user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:favorite) { 'Bad Request!!' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/favorites' do
    get 'Displays a list of favorites of given user' do
      tags 'Favorites'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      security [ApiKeyAuth: []]
      parameter name: :user_id, in: :path, type: :string
      response '200', 'Favorites found' do
        response(200, 'List of cars') do
          run_test!
        end

        response(404, 'Whoops!! Something went wrong') do
          run_test!
        end
      end
    end
  end

  path '/users/{user_id}/favorites/{id}' do
    delete 'Deletes a favorite' do
      tags 'Favorites'
      consumes 'application/json'
      produces 'application/json'
      security [ApiKeyAuth: []]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      response '200', 'Destroy favorite' do
        response(200, 'Favorite destroyed') do
          run_test!
        end

        response(404, 'Whoops!! Something went wrong') do
          run_test!
        end
      end
    end
  end
end
