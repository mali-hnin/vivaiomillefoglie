require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "new order email" do
    # Set up an order based on the fixture
    order = orders(:one)

    # Set up an email using the order contents
    email = OrderMailer.with(order: order).new_order_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal ENV["ADMIN_EMAIL"], email.from
    assert_equal ENV["ADMIN_EMAIL"], email.to
    assert_equal "You got a new order!", email.subject
    assert_match order.name, email.html_part.body.encoded
    assert_match order.name, email.text_part.body.encoded
    assert_match order.email, email.html_part.body.encoded
    assert_match order.email, email.text_part.body.encoded
    assert_match order.address, email.html_part.body.encoded
    assert_match order.address, email.text_part.body.encoded
    assert_match order.phone, email.html_part.body.encoded
    assert_match order.phone, email.text_part.body.encoded
    assert_match order.message, email.html_part.body.encoded
    assert_match order.message, email.text_part.body.encoded
  end
end
ENV["GMAIL_USERNAME"]
