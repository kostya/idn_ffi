module IDNFFI::Methods

  def to_ascii(str, flags = IDNFFI::IDNA_ALLOW_UNASSIGNED)
    transform(:idna_to_ascii_8z, str, flags)
  end
  
  def to_unicode(str, flags = IDNFFI::IDNA_ALLOW_UNASSIGNED)
    transform(:idna_to_unicode_8z8z, str, flags)
  end
  
private

  UTF8 = "UTF-8"

  def transform(method, str, flags)
    return unless str
    pointer = FFI::MemoryPointer.new :pointer
    int = IDNFFI::Lib.send(method, str, pointer, flags)
    raise IDNFFI::Error, "bad answer from libidn #{int}, http://www.gnu.org/software/libidn/reference/libidn-idna.html#IDNA-SUCCESS:CAPS" if int != 0
    strptr = pointer.read_pointer()
    result = strptr.read_string()
    pointer.free
    result.force_encoding(UTF8) if result.respond_to?(:force_encoding)
    result                                      
  end

end
