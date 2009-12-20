module FlowPagination

  # FlowPagination renderer for (Mislav) WillPaginate Plugin
  class LinkRenderer < WillPaginate::LinkRenderer

    # Render flow navigation
    def to_html
      # flow_pagination = ''
      flow_pagination = @template.link_to(
        I18n.t('flow_pagination.link_text', :default => 'More'),
        self.next_page.to_s, 
        :id => 'flow_pager'
      )
      # if self.current_page < self.last_page
      #   flow_pagination = @template.button_to_remote(
      #       @template.t('flow_pagination.button', :default => 'More'),
      #       :url => { :controller => @template.controller_name,
      #         :action => @template.action_name,
      #         :params => @template.params.merge!(:page => self.next_page)},
      #       :method => @template.request.request_method)
      # end

      @template.content_tag(:div, flow_pagination, :id => 'flow_pagination')

    end

    protected

      # Get current page number
      def current_page
        @collection.current_page
      end

      # Get last page number
      def last_page
        @last_page ||= WillPaginate::ViewHelpers.total_pages_for_collection(@collection)
      end

      # Get next page number
      def next_page
        @collection.next_page
      end

  end

end
