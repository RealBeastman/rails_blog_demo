class PostContract < Dry::Validation::Contract
  params do
    required(:title).filled(:string)
    required(:body).filled(:string)
  end

  rule(:title) do
    key.failure('must be at least 5 characters long') if value.length < 5
  end

  rule(:body) do
    key.failure('must be at least 20 characters long') if value.length < 20
  end
end
