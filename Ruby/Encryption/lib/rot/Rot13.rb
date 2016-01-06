require_relative 'Rot'

module Encryption
  class Encryption::Rot13 < Encryption::Rot

    def initialize(case_insensitive = false, upper = false)
      super(13, case_insensitive, upper)
    end

    undef_method :rotation=

    undef_method :decrypt_s
    def decrypt_s(s)
      encrypt_s(s)
    end

    undef_method :decrypt_c
    def decrypt_c(c)
      encrypt_c
    end

  end
end