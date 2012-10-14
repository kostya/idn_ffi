require File.join(File.dirname(__FILE__), %w{ idn_ffi version } )
require File.join(File.dirname(__FILE__), %w{ idn_ffi idn_lib } )
require File.join(File.dirname(__FILE__), %w{ idn_ffi methods } )

module IDNFFI
  extend IDNFFI::Methods
 
  class Error < Exception; end  
end
