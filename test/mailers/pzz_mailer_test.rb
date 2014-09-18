require 'test_helper'

class PzzMailerTest < ActionMailer::TestCase
  test "inform" do
    mail = PzzMailer.inform
    assert_equal "Inform", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
