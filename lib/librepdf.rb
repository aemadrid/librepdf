require "librepdf/version"

if defined?(Java) and defined?(JRUBY_VERSION) and PLATFORM == 'java'
  require 'java'
  
  module Librepdf
    require 'librepdf/java/snakeyaml-1.14'
    require 'librepdf/java/juh-3.2.1'
    require 'librepdf/java/jurt-3.2.1'
    require 'librepdf/java/ridl-3.2.1'
    require 'librepdf/java/unoil-3.2.1'
    require 'librepdf/java/librepdf'
   
    import 'librepdf.Connection'
    import 'librepdf.document.Document'
    class Document
      import 'librepdf.document.Calc'
      import 'librepdf.document.Chart'
      import 'librepdf.document.Draw'
      import 'librepdf.document.Global'
      import 'librepdf.document.Impress'
      import 'librepdf.document.Math'
      import 'librepdf.document.Web'
      import 'librepdf.document.Writer'
    end
  end
else
  warn "librepdf is for use with JRuby only"
end

