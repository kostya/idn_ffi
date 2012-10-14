require 'ffi'

module IDNFFI::Lib
  extend FFI::Library
  ffi_lib 'idn'
      
  attach_function :idna_to_ascii_8z, [:string, :pointer, :int], :int
  attach_function :idna_to_unicode_8z8z, [:string, :pointer, :int], :int
end
          