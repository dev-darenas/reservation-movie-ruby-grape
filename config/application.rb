require_relative 'boot'

## Load API
require_relative '../app/api/v1/movies'
require_relative '../app/api/v1/reservations'
require_relative '../app/api/base'

## Load transactions
require_relative '../app/transactions/base_transaction'
require_relative '../app/transactions/movies_transactions/create'
require_relative '../app/transactions/reservations_transactions/create'

## Load db
require_relative '../db/setup'

## Load models
require_relative '../app/models/movie'
require_relative '../app/models/customer'
require_relative '../app/models/reservation'
