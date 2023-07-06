require 'swagger_helper'

RSpec.describe '/products', type: :request do
  path '/products' do
    get('list products') do
      response(200, 'successful') do
        let(:products) { create_list(:product, 2) }

        run_test! do
          records = response.parsed_body['records']
          expect(records.size).to eq(2)
        end
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end
end
