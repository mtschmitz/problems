require 'spec_helper'

describe "problems/new" do
  before(:each) do
    assign(:problem, stub_model(Problem,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", problems_path, "post" do
      assert_select "input#problem_user_id[name=?]", "problem[user_id]"
      assert_select "input#problem_name[name=?]", "problem[name]"
      assert_select "textarea#problem_description[name=?]", "problem[description]"
    end
  end
end
