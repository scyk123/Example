class TestRot13 < MiniTest::Test

  def test_rot13_encrypt_c
    assert_equal 'n', Encryption::Rot13.new.encrypt_c('a')
  end

  def test_rot13_encrypt_s_1
    assert_equal 'Syrr ng bapr!', Encryption::Rot13.new.encrypt_s('Flee at once!')
  end

  def test_rot13_encrypt_s_2
    assert_equal 'SYRR NG BAPR!', Encryption::Rot13.new(true, true).encrypt_s('Flee at once!')
  end

  def test_rot13_decrypt_s
    rot13 = Encryption::Rot13.new
    enc = rot13.encrypt_s('Flee')
    assert_equal 'Syrr', enc
    dec = rot13.decrypt_s(enc)
    assert_equal 'Flee', dec
  end

  def test_rot13_decrypt_c
    rot13 = Encryption::Rot13.new
    enc = rot13.encrypt_c('a')
    assert_equal 'n', enc
    dec = rot13.decrypt_s(enc)
    assert_equal 'a', dec
  end
end