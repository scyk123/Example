class TestRotEncryptC < MiniTest::Test
  def test_encrypt_c_1
    assert_equal 'a', Encryption::Rot.new.encrypt_c('a')
  end

  def test_encrypt_c_2
    assert_equal 'b', Encryption::Rot.new(1).encrypt_c('a') 
  end

  def test_encrypt_c_3
    assert_equal 'B', Encryption::Rot.new(1).encrypt_c('A')
  end

  def test_encrypt_c_4
    assert_equal 'Z', Encryption::Rot.new(-1).encrypt_c('A')
  end

  def test_encrypt_c_5
    assert_equal 'A', Encryption::Rot.new(1).encrypt_c('Z')
  end

  def test_encrypt_c_6
    assert_equal 'A', Encryption::Rot.new(26).encrypt_c('A')
  end

  def test_encrypt_c_7
    assert_equal 'b', Encryption::Rot.new(1, true).encrypt_c('A')
  end

  def test_encrypt_c_8
    assert_equal 'B', Encryption::Rot.new(1, true, true).encrypt_c('a')
  end
end