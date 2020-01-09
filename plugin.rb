# frozen_string_literal: true

module Onebox
    module Engine
      class XinhuaNetOnebox
        include Engine
        include LayoutSupport
        include HTML
  
        matches_regexp(/^(http?:\/\/)?(www\.)?xinhuanet\.com\/(.)+\/?$/)

        private
  
        def data
          {
            url: @url,
            title: raw.css('title').text.sub(/-新华网/, '').strip(),
            image: raw.css('.net-logo img').first['src'],
            description: raw.css('meta[name=description]').first['content']
          }
        end
      end
    end
  end
