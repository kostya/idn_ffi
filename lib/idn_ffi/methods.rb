module IDNFFI::Methods

  # flags 
  IDNA_ALLOW_UNASSIGNED = 0x0001      # Don't reject strings containing unassigned Unicode code points.
  IDNA_USE_STD3_ASCII_RULES = 0x0002  # Validate strings according to STD3 rules (i.e., normal host name rules).

  def to_ascii(str, flags = IDNA_ALLOW_UNASSIGNED)
    transform(:idna_to_ascii_8z, str, flags)
  end
  
  def to_unicode(str, flags = IDNA_ALLOW_UNASSIGNED)
    transform(:idna_to_unicode_8z8z, str, flags)
  end
  
private

  UTF8 = "UTF-8"

  if RUBY_VERSION >= "1.9"
    def transform(method, str, flags)
      return unless str
      pointer = FFI::MemoryPointer.new :pointer
      int = IDNFFI::Lib.send(method, str, pointer, flags)
      raise IDNFFI::Error, "bad answer from libidn #{ind}, http://www.gnu.org/software/libidn/reference/libidn-idna.html#IDNA-SUCCESS:CAPS" if int != 0
      strptr = pointer.read_pointer()
      result = strptr.read_string()
      pointer.free
      result.force_encoding(UTF8)
      result                                      
    end
  else
    def transform(method, str, flags)
      return unless str
      pointer = FFI::MemoryPointer.new :pointer
      int = IDNFFI::Lib.send(method, str, pointer, flags)
      raise IDNFFI::Error, "bad answer from libidn #{ind}, http://www.gnu.org/software/libidn/reference/libidn-idna.html#IDNA-SUCCESS:CAPS" if int != 0
      strptr = pointer.read_pointer()
      result = strptr.read_string()
      pointer.free
      result
    end                                          
  end

end
