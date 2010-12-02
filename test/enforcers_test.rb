require "test_helper"

class EnforcersTest < MiniTest::Unit::TestCase
  def setup
    @article = MiniTest::Mock.new
    @user = MiniTest::Mock.new
    @controller = Controller.new
    @controller.article = @article
    @controller.current_user = @user
  end

  def test_not_raise_error_if_can
    @user.expect(:can?, true, [:view, @article])
    @controller.show
    @user.verify
  end

  def test_raises_if_invalid_action_given
    @controller.current_user = User.new
    assert_raises(Cannabis::Exceptions::InvalidAction) { @controller.vaporize }
  end

  def test_raise_error_if_cannot
    @user.expect(:can?, false, [:view, @article])
    assert_raises(Cannabis::Exceptions::Transgression) { @controller.show }
    @user.verify
  end

  def test_be_able_to_override_can_xx_method
    @controller.current_user = nil
    assert_raises(Cannabis::Exceptions::Transgression) { @controller.update }
  end
end
