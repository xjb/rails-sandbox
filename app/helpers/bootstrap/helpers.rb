module Bootstrap
  module Helpers
    # https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html
    # https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/url_helper.rb
    module UrlHelper
      def link_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options, name = options, name, block if block_given?
        html_options = (html_options ||= {}).stringify_keys

        html_options['class'] ||= 'btn btn-dark'
        super
      end

      def button_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options = options, name if block_given?
        html_options = (html_options || {}).stringify_keys

        html_options['class'] ||= 'btn btn-dark'
        super
      end

      def link_to_unless_current(name, options = {}, html_options = {}, &block)
        super
      end

      def link_to_unless(condition, name, options = {}, html_options = {}, &block)
        super
      end

      def link_to_if(condition, name, options = {}, html_options = {}, &block)
        super
      end

      def mail_to(email_address, name = nil, html_options = {}, &block)
        # html_options, name = name, nil if name.is_a?(Hash)
        # html_options = (html_options || {}).stringify_keys

        super
      end

      def sms_to(phone_number, name = nil, html_options = {}, &block)
        # html_options, name = name, nil if name.is_a?(Hash)
        # html_options = (html_options || {}).stringify_keys

        super
      end

      def phone_to(phone_number, name = nil, html_options = {}, &block)
        # html_options, name = name, nil if name.is_a?(Hash)
        # html_options = (html_options || {}).stringify_keys

        super
      end
    end

    include UrlHelper
  end
end
