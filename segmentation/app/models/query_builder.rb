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
   condition = ""
   query = []
   JSON.parse(self.condition).each  do |value|
     obj = OpenStruct.new(value)
     values << obj.value unless obj.value.nil?
     condition = condition + obj.field + "  #{obj.operator}" + " ? " unless obj.field.nil? and obj.operator.nil?
     condition  = condition + "  #{obj.agregator} " unless obj.agregator.nil?
   end
   query << condition
   values.each_with_index do |value, index|
      query << value
   end
   query
  end

end
