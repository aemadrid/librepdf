require "librepdf/version"

if RUBY_ENGINE == 'jruby'
  require 'java'

  ROOT = File.expand_path('../..', __FILE__)

  module Librepdf
    require ROOT + '/java/lib/snakeyaml-1.14'
    require ROOT + '/java/lib/juh-3.2.1'
    require ROOT + '/java/lib/jurt-3.2.1'
    require ROOT + '/java/lib/ridl-3.2.1'
    require ROOT + '/java/lib/unoil-3.2.1'
    require ROOT + '/java/lib/librepdf'

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

