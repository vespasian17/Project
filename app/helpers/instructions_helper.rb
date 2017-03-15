module InstructionsHelper
	def tag_cloud(tags, classes)
		max = tags.sort_by(&:count).last
		tags.each do |tag|
			index = tag.count.to_f / max.count * (classes.size - 1)
			yield(tag, classes[index.round])
		end
	end

	def parse_url(url)
		url.split('/')[3].strip
	end

	def youtube(url)
		"https://www.youtube.com/embed/" + parse_url(url)
	end
end
