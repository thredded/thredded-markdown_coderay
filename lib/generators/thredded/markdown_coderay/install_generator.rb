# frozen_string_literal: true
module Thredded
  module MarkdownCoderay
    class InstallGenerator < Rails::Generators::Base
      desc 'Installs Thredded Markdown Coderay plugin.'
      source_root File.expand_path(
        '../../../templates/thredded/markdown_coderay/install',
        File.dirname(__FILE__)
      )
      public_task :install

      def install
        copy_file '_layout.scss',
                  'app/assets/stylesheets/coderay/_layout.scss'
        copy_file '_day.scss',
                  'app/assets/stylesheets/coderay/_day.scss'
        copy_file '_night.scss',
                  'app/assets/stylesheets/coderay/_night.scss'
        add_import_if_file_exists 'application.scss', 'coderay/day'
        add_import_if_file_exists 'day.scss', 'coderay/day'
        add_import_if_file_exists 'night.scss', 'coderay/night'
        add_import_if_file_exists 'email.scss', 'coderay/day'
      end

      private

      def add_import_if_file_exists(file, import)
        path = File.join('app', 'assets', 'stylesheets', file)
        return unless File.exist?(path)
        append_to_file path, <<~SCSS
            @import "#{import}";
        SCSS
      end
    end
  end
end
