require "test_helper"

class CannabisTest < MiniTest::Unit::TestCase
  def test_have_view_action_by_default
    assert_equal :viewable, Cannabis.actions[:view]
  end

  def test_have_create_action_by_default
    assert_equal :creatable, Cannabis.actions[:create]
  end

  def test_have_update_action_by_default
    assert_equal :updatable, Cannabis.actions[:update]
  end

  def test_have_destroy_action_by_default
    assert_equal :destroyable, Cannabis.actions[:destroy]
  end

  def test_be_able_to_add_another_action
    Cannabis.add(:publish, :publishable)
    assert_equal :publishable, Cannabis.actions[:publish]
  end
end
