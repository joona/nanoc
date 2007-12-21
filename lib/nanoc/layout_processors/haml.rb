module Nanoc::LayoutProcessor::Haml
  class HamlLayoutProcessor < Nanoc::LayoutProcessor

    identifiers :haml
    extensions  '.haml'

    def run(layout)
      nanoc_require 'haml'

      options = @page[:haml_options] || {}
      assigns = @other_assigns.merge({ :page => @page, :pages => @pages, :config => @config, :site => @site })
      options[:locals] = assigns

      ::Haml::Engine.new(layout, options).to_html
    end

  end
end
