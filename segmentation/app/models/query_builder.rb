# encoding: utf-8

require 'json'

class QueryBuilder < ActiveRecord::Base

  AVAILABLE_FIELDS = %w{ name email age state role }
  AVAILABLE_OPERATORS = %w{ < > = <= >=}
  AGREGATORS = %w{OR AND}

  attr_accessor :field, :operator, :agregator, :value

  def to_json(value)
    value.delete("name")
    value.delete("condition")
    value #.to_json
  end

  def builder
   values = []
   condition = ""
   query = []
   eval(self.condition).each  do |value|
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
