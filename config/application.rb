require_relative 'boot'

require_relative '../app/api/v1/movies'
require_relative '../app/api/base'

require_relative '../app/transactions/base_transaction'
require_relative '../app/transactions/movies_transactions/create'

require_relative '../db/setup'

require_relative '../app/models/movie'
