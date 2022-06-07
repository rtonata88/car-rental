require 'swagger_helper'

RSpec.describe 'cars' do
  path '/cars' do
    get('Display a list of cars') do
      tags 'Cars'
      produces 'application/json'
      response(200, 'List of cars') do
        run_test!
      end

      response(404, 'Whoops!! Something went wrong') do
        run_test!
      end
    end
  end

  path '/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Car found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 model: { type: :string },
                 make: { type: :string },
                 image: { type: :string },
                 description: { type: :string }
               },
               required: %w[id name model make image description]

        let(:id) { Car.create(name: 'Series 740', make: 'BMW', image: 'https://d2cnxbg536lf2p.cloudfront.net/test/file_5c438b938bf660_86124239.jpg', model: '2021', description: 'The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.').id }
        run_test!
      end

      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
