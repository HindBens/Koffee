module ApplicationHelper

def quid(num)
	number_to_currency num / 100.0, unit: "&pound"
end



end
