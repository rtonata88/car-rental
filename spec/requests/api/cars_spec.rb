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

   path '/cars/{id}' do
        get('Display a list of cars') do
            tags 'Cars'
            consumes 'application/json'
            produces 'application/json'
            parameter name: :id, in: :path, type: :string
            response(200, 'List of cars found') do
            schema type: :object,
                properties: {
                    name: { type: :string },
                    make: { type: :string },
                    image: { type: :string },
                    model: { type: :string },
                    description: { type: :string }
                },
                required: %w[name description make image model]

                let(:id) do
                { name: 'Vogue', 
                    make: "Range Rover",
                    description: 'The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.', 
                    image: "https://d2cnxbg536lf2p.cloudfront.net/test/file_5d14dc974de986_60230467.jpeg", 
                    model: '2022' }
                end
                run_test!
            end
        end
        response(404, 'Whoops!! Something went wrong') do
            run_test!
        end
  end
end