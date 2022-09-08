# RB130
# Exercises
# Medium 2 Testing

# text_test.rb

require 'minitest/autorun'

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text3.txt', 'r')
    @updated_file = File.open('sample_text3_after.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    updated_file = File.open('sample_text3_after.txt', 'r')
    new_text = updated_file.read
    assert_equal new_text, text.swap('a', 'e')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
    @updated_file.close
    puts "File has been closed: #{@updated_file.closed?}"
  end
end

