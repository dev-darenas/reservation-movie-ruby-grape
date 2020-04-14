#require_relative 'config/application'
require 'yaml'
require "erb"
require_relative 'config/boot'

DEFAULTDATABASE = 'postgres'
namespace :db do
  desc "Creates the database"
	task :create do
    puts "Creating database..."

    db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)
    database_name = db_config['development']['database']
    db_config['development']['database'] = DEFAULTDATABASE

    Sequel.connect(db_config['development']) do |db|
      db.execute "CREATE DATABASE #{database_name}"
      puts "database #{database_name} created"
    end
  end
  
  desc "Add fields to DB"
  task :migrate do
    puts "created tables..."
    
    db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)
    db = Sequel.connect(db_config['development'])
    
    db.create_table :customers do
      primary_key :id
      String :name
      String :email
      String :identification
    end

    db.create_table :movies do
      primary_key :id
      String :name
      String :description
      String :image_url
      Date :start_date
      Date :end_date
    end

    db.create_table :reservations do
      primary_key :id
      Integer :movie_id
      Integer :customer_id
      Date :reservation_date
    end

    puts "tables created."
  end

  desc "Drop the database"
  task :drop do
    puts "dropping database..."

    db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)
    database_name = db_config['development']['database']
    db_config['development']['database'] = DEFAULTDATABASE

    Sequel.connect(db_config['development']) do |db|
      db.execute "DROP DATABASE IF EXISTS #{database_name}"
      puts "database #{database_name} dropped"
    end
  end
end
