require 'test_helper'

class SwotTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swot_table = swot_tables(:one)
    @password = '123456789'
    @confirmed_user = User.create(email: "#{rand(50000)}@example.com", 
                              password: @password)
  end

  test "should get index" do
    get swot_tables_url
    assert_response :success
  end

  test "should get new" do
    sign_in(user: @confirmed_user, password: '123456789')
    get new_swot_table_url
    assert_response :success
  end

  test "should create swot_table" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('SwotTable.count') do
      post swot_tables_url, params: { swot_table: { opportunity: @swot_table.opportunity, strength: @swot_table.strength, threats: @swot_table.threats, title: @swot_table.title, weakness: @swot_table.weakness } }
    end

    assert_redirected_to swot_table_url(SwotTable.last)
  end

  test "should show swot_table" do
    sign_in(user: @confirmed_user, password: '123456789')
    get swot_table_url(@swot_table)
    assert_response :success
  end

  test "should get edit" do
    sign_in(user: @confirmed_user, password: '123456789')
    get edit_swot_table_url(@swot_table)
    assert_response :success
  end

  test "should update swot_table" do
    sign_in(user: @confirmed_user, password: '123456789')
    patch swot_table_url(@swot_table), params: { swot_table: { opportunity: @swot_table.opportunity, strength: @swot_table.strength, threats: @swot_table.threats, title: @swot_table.title, weakness: @swot_table.weakness } }
    assert_redirected_to swot_table_url(@swot_table)
  end

  test "should destroy swot_table" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('SwotTable.count', -1) do
      delete swot_table_url(@swot_table)
    end

    assert_redirected_to swot_tables_url
  end
end
