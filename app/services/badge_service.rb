class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
  end

  private

  def badge_rule
    Badge.all.each do |badge|
      if send("#{badge.rule}_badge?")
        @current_user.badges << badge
        @badge = badge
      end
    end

  end

  def first_badge?
    @test_passage.attempt == 1 && @test_passage.success == true && Badge.find_by(kind: 1) != nil

  end

  def level_badge?
    Test.tests_level(@test_passage.test.level).count == @current_user.tests.tests_level(@test_passage.test.level).count && @current_user.tests.tests_level(@test_passage.test.level).count != nil && Badge.find_by(kind: 0) != nil

  end

  def category_badge?
    Test.tests_category(@test_passage.test.category.title).count == @current_user.tests.tests_category(@test_passage.test.category.title).where(test_passages: { success: true }).count && @current_user.tests.tests_category(@test_passage.test.category.title).where(test_passages: { success: true }).count != nil && Badge.find_by(kind: 2) != nil

  end
end