require 'rails_helper'
require 'json'

RSpec.describe QueryBuilder, type: :model do

  before(:all) do
    Contact.new(name: "Eder", email: "eder@gmail.com", age: 31, state: "Goias", role: "Software Analist").save
    Contact.new(name: "Wender", email: "wender@gmail.com", age: 20, state: "Goias", role: "DevOps").save
    Contact.new(name: "Daniel", email: "daniel@gmail.com", age: 39, state: "Minas Gerais", role: "Manager").save
    Contact.new(name: "Fabricio", email: "fabricio@gmail.com", age: 34, state: "Sao Paulo", role: "Administration").save
    Contact.new(name: "Leonardo", email: "leo@gmail.com", age: 15, state: "Sao Paulo", role: "Administration").save
    Contact.new(name: "Gabriel", email: "gabriel@gmail.com", age: 40, state: "Goias", role: "Software Analist").save
    Contact.new(name: "Diego", email: "diego@gmail.com", age: 28, state: "Rondonia", role: "Tester").save
    Contact.new(name: "Guilherme", email: "gui@gmail.com", age: 18, state: "Rondonia", role: "Manager").save
    Contact.new(name: "Joao", email: "joao@gmail.com", age: 25, state: "DF", role: "Analist").save
  end

  it 'get by state and age' do
    query = QueryBuilder.create(name: "Find by state Goias", condition: '[{"field": "state","operator": "=", "value": "Goias"},{"agregator": "AND"},{"field": "age", "operator": ">", "value": "30"}]')
    condition = query.builder
    p condition
    expect(Contact.where(condition).size).to eq(2)
  end

end
