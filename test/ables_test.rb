require "test_helper"

class AblesTest < MiniTest::Unit::TestCase
  def setup
    @resource = Resource.new
    @user = MiniTest::Mock.new
  end

  def test_default_viewable_by_to_true
    assert @resource.viewable_by?(@user)
  end

  def test_default_creatable_by_to_true
    assert @resource.creatable_by?(@user)
  end

  def test_default_updatable_by_to_true
    assert @resource.updatable_by?(@user)
  end

  def test_default_destroyable_by_to_true
    assert @resource.destroyable_by?(@user)
  end
end
