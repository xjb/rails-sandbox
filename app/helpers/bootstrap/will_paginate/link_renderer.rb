require 'will_paginate/view_helpers/action_view'

# NOTE: see
# https://getbootstrap.jp/docs/5.0/components/pagination/
#
# ```html
# <nav aria-label="Page navigation example">
#   <ul class="pagination justify-content-center">
#     <li class="page-item disabled">
#       <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
#     </li>
#     <li class="page-item"><a class="page-link" href="#">1</a></li>
#     <li class="page-item active" aria-current="page">
#       <a class="page-link" href="#">2</a>
#     </li>
#     <li class="page-item"><a class="page-link" href="#">3</a></li>
#     <li class="page-item">
#       <a class="page-link" href="#">Next</a>
#     </li>
#   </ul>
# </nav>
# ```
#
# https://github.com/mislav/will_paginate/blob/master/lib/will_paginate/view_helpers/link_renderer.rb
#
module Bootstrap
  module WillPaginate
    class LinkRenderer < ::WillPaginate::ActionView::LinkRenderer
      def container_attributes # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      protected

      def page_number(page)
        if page == current_page
          tag(:li,
              link(page, '#', class: 'page-link'),
              class: 'page-item active', 'aria-current': 'page')
        else
          tag(:li,
              link(page, page, class: 'page-link'),
              class: 'page-item')
        end
      end

      def gap # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def previous_page # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def next_page # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def previous_or_next_page(page, text, _classname)
        if page
          tag(:li,
              link(text, page, class: 'page-link'),
              class: 'page-item')
        else
          tag(:li,
              link(text, page, class: 'page-link', tabindex: -1, 'aria-disabled': true),
              class: 'page-item disabled')
        end
      end

      def html_container(html)
        tag(:nav,
            tag(:div, html, class: 'pagination justify-content-end'),
            'aria-label': 'Page navigation')
      end
    end
  end
end
