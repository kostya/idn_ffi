require File.join(File.dirname(__FILE__), %w{ idn_ffi version } )
require File.join(File.dirname(__FILE__), %w{ idn_ffi idn_lib } )
require File.join(File.dirname(__FILE__), %w{ idn_ffi methods } )

module IDNFFI

  IDNA_ALLOW_UNASSIGNED = 0x0001      # Don't reject strings containing unassigned Unicode code points.
  IDNA_USE_STD3_ASCII_RULES = 0x0002  # Validate strings according to STD3 rules (i.e., normal host name rules).

  extend IDNFFI::Methods
 
  class Error < Exception; end  
end