require 'test_helper'

class StaticpagesFlowTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get '/'
    assert_response :success
  end
  test "static pages home is default root" do
    assert_recognizes({controller: 'staticpages', action: 'home'}, '/')
  end

  test "nother test" do
     get '/'
     assert_select "title", "Sportfolio"
     assert_select 'ul.nav-items' do
       assert_select 'li.search'
    end
  end

end
