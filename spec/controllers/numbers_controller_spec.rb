require "spec_helper"

describe Api::NumbersController do
  describe "#show" do
    it "responds successfully using the selected plugin" do
      plugin = mock('mock')
      plugin.expects(:get).returns(180)
      Sources.expects(:number_plugin).with('demo').returns(plugin)
      get :show, :source => 'demo', :format => :json

      assert_response :success
      result = JSON.parse(@response.body)
      assert_equal({ 'value' => 180 }, result)
    end
  end
end