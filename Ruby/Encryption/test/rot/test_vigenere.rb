class TestVigenereEncrypt < MiniTest::Test
  def test_encrypt_c_1
    rot = Encryption::Vigenere.new('h')
    assert_equal 'h', rot.encrypt_c('a')
  end
  def test_encrypt_s_1
    rot = Encryption::Vigenere.new('hello world')
    assert_equal 'hello world', rot.encrypt_s('aaaaa aaaaa')
  end
  def test_decrypt_c_1
    rot = Encryption::Vigenere.new('h')
    enc = rot.encrypt_c('a')
    assert_equal 'h', enc
    dec = rot.decrypt_c(enc)
    assert_equal 'a', dec
  end
  def test_decrypt_s_1
    rot = Encryption::Vigenere.new('hello world')
    enc = rot.encrypt_s('aaaaa aaaaa')
    assert_equal 'hello world', enc
    dec = rot.decrypt_s(enc)
    assert_equal 'aaaaa aaaaa', dec
  end
  def test_extra_args_1
    rot = Encryption::Vigenere.new('hello world', true, true)
    enc = rot.encrypt_s('aaaaa aaaaa')
    assert_equal 'HELLO WORLD', enc
  end
  def test_blank_cipher_1
    rot = Encryption::Vigenere.new('')
    enc = rot.encrypt_s('a')
    assert_equal 'a', enc
  end
end