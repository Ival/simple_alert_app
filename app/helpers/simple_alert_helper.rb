module SimpleAlertHelper
	def simple_alert *args
		@options = args.extract_options!
		@meg = args.first
		
		@options[:icon] ||= :tag
		
		@options[:point] ||= []
		if @options[:point].include? :right
			@options[:point].delete :left if @options[:point].include? :left
		else
			@options[:point].push :right unless @options[:point].include? :left
		end
		if @options[:point].include? :top
			@options[:point].delete :bottom if @options[:point].include? :bottom
		else
			@options[:point].push :top unless @options[:point].include? :bottom
		end
		
		return content_tag("div", :class => "alert-tag #{(@options[:point].collect { |p| 'alert-point-' + p.to_s }).join(" ")}") do 
			alert_header + content_tag("div", "undisplay", :class => "alert-content")
		end
	end
	
	private
	
	def alert
		
	end
	
	def alert_header
		content_tag("div", :class => "alert-title") do
			content_tag("span", "", :class => "alert-icon  alert-icon-#{@options[:icon]}") + 
			content_tag("h4", "#{@options[:title]}", :style => "width:272px;") + 
			content_tag("a", "", :class => 'alert-icon alert-icon-remove alert-close')
		end
	end

end
