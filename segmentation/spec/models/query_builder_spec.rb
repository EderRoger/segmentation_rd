require 'rails_helper'

RSpec.describe QueryBuilder, type: :model do

  before(:all) do
    Contact.new(name: "Eder", email: "eder@gmail.com", age: 31, state: "Goias", role: "Software Analist").save
    Contact.new(name: "Wender", email: "wender@gmail.com", age: 40, state: "Goias", role: "DevOps").save
    Contact.new(name: "Daniel", email: "daniel@gmail.com", age: 39, state: "Minas Gerais", role: "Manager").save
    Contact.new(name: "Fabricio", email: "fabricio@gmail.com", age: 34, state: "Sao Paulo", role: "Administration").save
    Contact.new(name: "Leonardo", email: "leo@gmail.com", age: 15, state: "Goias", role: "Administration").save
    Contact.new(name: "Gabriel", email: "gabriel@gmail.com", age: 40, state: "Sao Paulo", role: "Software Analist").save
    Contact.new(name: "Diego", email: "diego@gmail.com", age: 28, state: "Rondonia", role: "Tester").save
    Contact.new(name: "Guilherme", email: "gui@gmail.com", age: 18, state: "Rondonia", role: "Manager").save
    Contact.new(name: "Joao", email: "joao@gmail.com", age: 25, state: "DF", role: "Analist").save
  end

  it 'get by state Goias and age >= 30' do
    query = QueryBuilder.create(name: "Find by state Goias and age >= 30", condition: "[{\"field\"=> \"state\",\"operator\" => \"=\", \"value\"=> \"Goias\"},{\"agregator\"=> \"AND\"},{\"field\"=> \"age\", \"operator\"=> \">=\", \"value\"=> \"30\"}]")
    condition = query.builder
    expect(Contact.where(condition.each{|value| value }).size).to eq(2)
  end

  it 'get by role Manager' do
    query = QueryBuilder.create(name: "Find by role Manager", condition: "[{\"field\"=>\"role\", \"operator\"=>\"=\", \"agregator\"=>\"\", \"value\"=>\"Manager\"}]")
    condition = query.builder
    expect(Contact.where(condition.each{|value| value }).size).to eq(2)
  end

it 'get by state Sao Paulo' do
    query = QueryBuilder.create(name: "Find by role Manager", condition: "[{\"field\"=>\"state\", \"operator\"=>\"=\", \"agregator\"=>\"\", \"value\"=>\"Sao Paulo\"}]")
    condition = query.builder
    expect(Contact.where(condition.each{|value| value }).size).to eq(2)
  end
end
