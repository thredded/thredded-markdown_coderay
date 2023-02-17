# frozen_string_literal: true

require 'thredded/markdown_coderay/version'
require 'thredded/markdown_coderay/railtie' if defined?(Rails)
require 'kramdown'
require 'kramdown-syntax-coderay'

module Thredded
  module MarkdownCoderay
    class << self
      attr_accessor :options

      def setup!
        assert_pipeline_contains! 'Thredded::HtmlPipeline::KramdownFilter'
        Thredded::HtmlPipeline::KramdownFilter.options.update(options)
        %w[div span code table td ol].each do |tag|
          allowlist_attribute! tag, 'class'
        end
      end

      private

      def assert_pipeline_contains!(name)
        return if pipeline_contains?(name)

        raise "#{self.class.name} requires #{name} in" \
              'Thredded::ContentFormatter.pipeline_filters'
      end

      def pipeline_contains?(name)
        Thredded::ContentFormatter.pipeline_filters.map(&:name).include?(name)
      end

      def allowlist_attribute!(tag, attribute)
        allowlist_attr = Thredded::ContentFormatter.allowlist[:attributes]
        allowlist_attr[tag] ||= []
        return if allowlist_attr[tag].include?(attribute)

        allowlist_attr[tag] << attribute
      end
    end

    self.options = {
      enable_coderay: true,
      syntax_highlighter: 'coderay',
      # See
      syntax_highlighter_opts: {
        css: 'class',
        line_number_anchors: false
      }
    }
  end
end
