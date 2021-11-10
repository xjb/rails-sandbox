module Bootstrap
  module WillPaginate
    module ActionView
      # NOTE: WillPaginate::ViewHelpers.pagination_options[:renderer] を設定しても使用されない
      #       ここで options[:renderer] のデフォルトを Bootstrap::WillPaginate::LinkRenderer に変更
      def will_paginate(collection = nil, options = {})
        options, collection = collection, nil if collection.is_a? Hash
        collection ||= infer_collection_from_controller

        options = options.symbolize_keys
        options[:renderer] ||= LinkRenderer

        super(collection, options)
      end
    end
  end
end
