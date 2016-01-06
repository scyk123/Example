class TestChain < MiniTest::Test

  def test_chain_1
    assert_equal 'b', Encryption::Chain.new(1).encrypt('a')
  end

  def test_chain_2
    assert_equal 'c', Encryption::Chain.new(1, 1).encrypt('a')
  end

  def test_chain_3
    assert_equal 'cat', Encryption::Chain.new(1, 'cat', -1).encrypt('aaa')
  end

end