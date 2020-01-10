# frozen_string_literal: true
# name: discourse-onebox-xinhuanet
# about: For generating pretty oneboxes for xinhuanet.com
# version: 0.1
# authors: dengzi

Onebox = Onebox

module Onebox
  module Engine
    class XinhuaNetOnebox
      include Engine
      include HTML

      matches_regexp(/^(http?:\/\/)?(www\.)?xinhuanet\.com\/(.)+\/?$/)

      def to_html
        result ={
          url: @url,
          title: raw.css('title').text.sub(/-新华网/, '').strip(),
          image: raw.css('.net-logo img').first['src'],
          description: raw.css('meta[name=description]').first['content']
        }

        <<-HTML
        <div class="onebox">
          <a href="#{@url}">
            <h3>#{result[:title]}</h3>
            <img src="#{result[:image]}" />
            <p>#{result[:description]}</p>
          </a>
      </div>
      HTML
      
      end
    end
  end
end
