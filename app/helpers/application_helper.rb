module ApplicationHelper

	def title_full(title_page)
		title_base = "Library App"

		if title_page.empty?
			title_base
		else
			"#{title_base} | #{title_page}"
		end
	end
end
