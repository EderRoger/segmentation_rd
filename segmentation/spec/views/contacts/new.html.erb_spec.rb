require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :name => "MyString",
      :email => "MyString",
      :age => 1,
      :state => "MyString",
      :role => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_name[name=?]", "contact[name]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "input#contact_age[name=?]", "contact[age]"

      assert_select "input#contact_state[name=?]", "contact[state]"

      assert_select "input#contact_role[name=?]", "contact[role]"
    end
  end
end
