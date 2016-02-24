require 'json'

class QueryBuilder < ActiveRecord::Base

  AVAILABLE_FIELDS = %w{ name, email, age, state, role }
  AVAILABLE_OPERATORS = %w{ <, >, =, <=, >=}
  AGREGATOR = %w{OR, AND}

  def self.available_fields
    AVAILABLE_FIELDS
  end

  def self.available_operators
    AVAILABLE_OPERATORS
  end

  def builder
   values = []
   JSON.parse(self.condition).each  do |value|
     obj = OpenStruct.new(value)
     values << obj.value
   end
  end

end
