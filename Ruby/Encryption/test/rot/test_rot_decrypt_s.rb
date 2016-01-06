class TestRotDecryptS < MiniTest::Test
  def test_decrypt_s_1
    rot = Encryption::Rot.new(1)
    enc = rot.encrypt_s('aA')
    assert_equal 'bB', enc
    dec = rot.decrypt_s(enc)
    assert_equal 'aA', dec
  end
end