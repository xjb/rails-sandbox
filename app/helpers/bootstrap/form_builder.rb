module Bootstrap
  # https://api.rubyonrails.org/v6.1.0/classes/ActionView/Helpers/FormBuilder.html
  class FormBuilder < ApplicationFormBuilder # rubocop:disable Metrics/ClassLength
    # https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/form_helper.rb

    def text_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def password_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def text_area(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def color_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control form-control-color'
      super
    end

    def search_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def telephone_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def phone_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def date_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def time_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def datetime_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def datetime_local_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def month_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def week_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def url_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def email_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def number_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def range_field(method, options = {})
      (options ||= {})[:class] ||= 'form-range'
      super
    end

    def fields_for(record_name, record_object = nil, fields_options = {}, &block)
      super
    end

    def fields(scope = nil, model: nil, **options, &block)
      super
    end

    def label(method, text = nil, options = {}, &block)
      (options ||= {})[:class] ||= 'form-label'
      super
    end

    def check_box(method, options = {}, checked_value = '1', unchecked_value = '0')
      (options ||= {})[:class] ||= 'form-check-input'
      super
    end

    def radio_button(method, tag_value, options = {})
      (options ||= {})[:class] ||= 'form-check-input'
      super
    end

    def hidden_field(method, options = {})
      super
    end

    def file_field(method, options = {})
      (options ||= {})[:class] ||= 'form-control'
      super
    end

    def submit(value = nil, options = {})
      if value.is_a?(Hash)
        options = value
        value = nil
      end
      (options ||= {})[:class] ||= 'btn btn-dark'
      super
    end

    def button(value = nil, options = {}, &block)
      if value.is_a?(Hash)
        options = value
        value = nil
      end
      (options ||= {})[:class] ||= 'btn btn-dark'
      super
    end

    # https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/form_options_helper.rb

    def select(method, choices = nil, options = {}, html_options = {}, &block)
      (html_options ||= {})[:class] ||= 'form-select'
      super
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
      (html_options ||= {})[:class] ||= 'form-select'
      super
    end

    def grouped_collection_select(method, # rubocop:disable Metrics/ParameterLists
                                  collection, group_method, group_label_method, option_key_method,
                                  option_value_method, options = {}, html_options = {})
      (html_options ||= {})[:class] ||= 'form-select'
      super
    end

    def time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
      (html_options ||= {})[:class] ||= 'form-select'
      super
    end

    # NOTE: BootstrapのForm gridは単一のlabel,inputのペアを<div class="form-check">でくくる必要があるため合わない
    def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block) # rubocop:disable Metrics/ParameterLists
      (html_options ||= {})[:class] ||= 'form-check-input'
      super
    end

    # NOTE: BootstrapのForm gridは単一のlabel,inputのペアを<div class="form-check">でくくる必要があるため合わない
    def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block) # rubocop:disable Metrics/ParameterLists
      (html_options ||= {})[:class] ||= 'form-check-input'
      super
    end

    # https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/date_helper.rb
    # NOTE: BootstrapのForm gridは単一の要素を<div class="col">でくくる必要があるため合わない

    def date_select(method, options = {}, html_options = {})
      super
    end

    def time_select(method, options = {}, html_options = {})
      super
    end

    def datetime_select(method, options = {}, html_options = {})
      super
    end

    # https://github.com/rails/rails/blob/main/actiontext/app/helpers/action_text/tag_helper.rb

    def rich_text_area(method, options = {})
      super
    end
  end
end
