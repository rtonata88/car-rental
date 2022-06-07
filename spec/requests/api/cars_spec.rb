require 'swagger_helper'

RSpec.describe 'cars' do
    path '/cars' do
        get('Display a list of cars') do
        tags 'Cars'
        consumes 'application/json'
        produces 'application/json'
        #parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
        response(200, 'List of cars found') do
            run_test!
        end

        response(404, 'Whoops!! Something went wrong') do
            run_test!
        end
    end
  end
end