class TestBlock < MiniTest::Test

  def test_block
    enc = Encryption::Rot.new(1).encrypt_s('a' * 6)
    assert_equal 'b' * 6, enc
    blk = Encryption::Block.block(enc, 3)
    assert_equal 'bbb bbb', blk
  end

end