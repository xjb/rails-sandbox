class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def enum_select(method, options = {}, html_options = {}, &block)
    enum = @object.class.try!(method.to_s.pluralize)
    choices = enum.keys.map do |key|
      [I18n.t(key, scope: [:enum, @object_name, method], default: key), key]
    end

    select(method, choices, options, html_options, &block)
  end
end
