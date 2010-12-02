require "minitest/autorun"
require "test_helper"

class CansTest < MiniTest::Unit::TestCase
  def setup
    @user = User.new
  end

  # can_view?
  def test_is_true_if_resource_is_viewable_by
    resource = MiniTest::Mock.new
    resource.expect(:viewable_by?, true, [@user])
    assert @user.can?(:view, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_not_viewable_by
    resource = MiniTest::Mock.new
    resource.expect(:viewable_by?, false, [@user])
    assert ! @user.can?(:view, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_nil
    assert ! @user.can?(:view, nil)
  end

  # can_create?
  def test_is_true_if_resource_is_creatable_by
    resource = MiniTest::Mock.new
    resource.expect(:creatable_by?, true, [@user])
    assert @user.can?(:create, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_not_creatable_by
    resource = MiniTest::Mock.new
    resource.expect(:creatable_by?, false, [@user])
    assert ! @user.can?(:create, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_nil
    assert ! @user.can?(:create, nil)
  end

  # can_update?
  def test_is_true_if_resource_is_updatable_by
    resource = MiniTest::Mock.new
    resource.expect(:updatable_by?, true, [@user])
    assert @user.can?(:update, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_not_updatable_by
    resource = MiniTest::Mock.new
    resource.expect(:updatable_by?, false, [@user])
    assert ! @user.can?(:update, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_nil
    assert ! @user.can?(:update, nil)
  end

  # can_destroy?
  def test_is_true_if_resource_is_destroyable_by
    resource = MiniTest::Mock.new
    resource.expect(:destroyable_by?, true, [@user])
    assert @user.can?(:destroy, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_not_destroyable_by
    resource = MiniTest::Mock.new
    resource.expect(:destroyable_by?, false, [@user])
    assert ! @user.can?(:destroy, resource)
    resource.verify
  end

  def test_is_false_if_resource_is_nil
    assert ! @user.can?(:destroy, nil)
  end
end
