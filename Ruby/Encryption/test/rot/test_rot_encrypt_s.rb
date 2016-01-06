class TestRotEncryptS < MiniTest::Test
  def test_encrypt_s_1
    assert_equal 'aA', Encryption::Rot.new.encrypt_s('aA')
  end

  def test_encrypt_s_2
    assert_equal 'bB', Encryption::Rot.new(1).encrypt_s('aA')
  end

  def test_encrypt_s_3
    assert_equal 'zZ', Encryption::Rot.new(-1).encrypt_s('aA')
  end

  def test_encrypt_s_4
    assert_equal 'aA', Encryption::Rot.new(1).encrypt_s('zZ')
  end

  def test_encrypt_s_5
    assert_equal 'Ifmmp Xpsme!', Encryption::Rot.new(1).encrypt_s('Hello World!')
  end

  def test_encrypt_s_6
    assert_equal 'ifmmp xpsme!', Encryption::Rot.new(1, true).encrypt_s('Hello World!')
  end

  def test_encrypt_s_7
    assert_equal 'IFMMP XPSME!', Encryption::Rot.new(1, true, true).encrypt_s('HELLO WORLD!')
  end

  def test_encrypt_s_8
    assert_equal 'hello world!', Encryption::Rot.new(-1, true).encrypt_s('ifmmp xpsme!')
  end

end