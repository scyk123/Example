class TestRotDecryptC < MiniTest::Test
  def test_decrypt_s_1
    rot = Encryption::Rot.new(1)
    enc = rot.encrypt_c('a')
    assert_equal 'b', enc
    dec = rot.decrypt_s(enc)
    assert_equal 'a', dec
  end
end