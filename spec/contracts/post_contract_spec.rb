require 'rails_helper'

RSpec.describe PostContract do
  let(:contract) { described_class.new }

  context 'when parameters are valid' do
    let(:valid_params) do
      {
        title: 'A Valid Post Title',
        body: 'This is a valid body with more than 20 characters.'
      }
    end

    it 'passes validation' do
      result = contract.call(valid_params)

      expect(result.success?).to be(true)
      expect(result.errors).to be_empty
    end
  end

  context 'when parameters are invalid' do
    it 'fails validation if title is too short' do
      invalid_params = {
        title: 'Bad',
        body: 'This is a valid body with more than 20 characters.'
      }

      result = contract.call(invalid_params)

      expect(result.success?).to be(false)
      expect(result.errors[:title]).to include('must be at least 5 characters long')
    end

    it 'fails validation if body is too short' do
      invalid_params = {
        title: 'Valid Title',
        body: 'Short body'
      }

      result = contract.call(invalid_params)

      expect(result.success?).to be(false)
      expect(result.errors[:body]).to include('must be at least 20 characters long')
    end

    it 'fails validation if title is missing' do
      invalid_params = {
        body: 'This is a valid body with more than 20 characters.'
      }

      result = contract.call(invalid_params)

      expect(result.success?).to be(false)
      expect(result.errors[:title]).to include('is missing')
    end

    it 'fails validation if body is missing' do
      invalid_params = {
        title: 'Valid Title'
      }

      result = contract.call(invalid_params)

      expect(result.success?).to be(false)
      expect(result.errors[:body]).to include('is missing')
    end
  end
end
