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
				<aside class="onebox xinhuanet">
				  <header class="source">
				    <a href="#{@url}">新华网</a>
			  	</header>
				  <article class="onebox-body">
			    	<h3>
				      <a href="#{@url}" target="_blank" rel="nofollow ugc noopener">
				        #{result[:title]}
				      </a>
				    </h3>
            <p>#{result[:description]}</p>
            </article>
           </aside> 
        HTML
        
			end
		end
	end
end
