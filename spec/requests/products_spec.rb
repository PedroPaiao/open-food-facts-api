require 'swagger_helper'

RSpec.describe '/products', type: :request do
  path '/products' do
    parameter name: :page,
              in: :query,
              type: :integer,
              description: 'page number',
              required: false

    parameter name: :per_page,
              in: :query,
              type: :integer,
              description: 'number of products per page',
              required: false

    get('list only 10 products') do
      response(200, 'successful') do
        examples

        let(:page) { 1 }
        let(:per_page) { 10 }
        let!(:products) { create_list(:product, 20) }

        run_test! do
          records = response.parsed_body['data']
          expect(records.size).to eq(10)
        end
      end
    end
  end

  path '/products/{code}' do
    parameter name: :code,
              in: :path,
              type: :string,
              description: 'code of product',
              required: true

    get('Show details of product') do
      response(200, 'successful') do
        examples

        let(:product) { create(:product) }
        let(:code) { product.code }

        run_test! do
          record = response.parsed_body
          expect(record['code']).to eq(product.code)
        end
      end
    end
  end
end
