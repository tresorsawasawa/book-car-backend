require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  path '/api/v1/cars' do
    post 'Create a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          car_model: { type: :string },
          price_per_day: { type: :integer },
          description: { type: :string },
          photo: { type: :string },
          car_type: { type: :string },
          transmission: { type: :string },
          user_id: { type: :integer }
        }
      }
      response '401', 'Car created' do
        let(:car) do
          { car: { car_model: 'Toyota', price_per_day: 2000, description: 'This is a car', photo: 'photo.jpeg',
                   car_type: 'jeep', transmission: 'manual' } }
        end
        run_test!
      end

      response '401', 'Invalid request' do
        let(:car) do
          { price_per_day: 2000, description: 'This is a car', photo: 'photo.jpeg', car_type: 'jeep',
            transmission: 'manual' }
        end
        run_test!
      end
    end
  end
end
