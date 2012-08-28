module SimpleAlertHelper
	def simple_alert *args
		@options = args.extract_options!
		@meg = args.first
		
		return content_tag("div", :class => "alert-tag #{point} #{type}", :style => "#{width}") do 
			alert_header + content_tag("div", "undisplay", :class => "alert-content")
		end
	end
	
	private
	
	def width
		@options[:width] ||= 300
		
		if @options[:width].class == String
			if @options[:width] =~ /^[0-9]+px$|^[0-9]+$/
				@options[:width].delete('px').to_i
			else
				@options[:width] = 300
			end
		end
	end
	
	def icon
		@options[:icon] ||= :tag
		
		"alert-icon-#{@options[:icon].to_s.sub("_", "-")}"
	end
	
	def point
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
		
		(@options[:point].collect { |p| 'alert-point-' + p.to_s }).join(" ")
	end
	
	def type
		@options[:type] ||= :default
		
		"alert-type-#{@options[:type]}"
	end
	
	def alert_header
		content_tag("div", :class => "alert-title") do
			content_tag("span", "", :class => "alert-icon  #{icon}") + 
			content_tag("h4", "#{@options[:title]}", :style => "width:#{width-28}px;") + 
			content_tag("a", "", :class => 'alert-icon alert-icon-remove alert-close')
		end
	end

end
