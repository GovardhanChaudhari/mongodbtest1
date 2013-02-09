require 'csv'

CSV.foreach("./test.csv") do |row|
	if (!(row[0] == "College code") &&  row[0] != nil)
		p row[0]
	end	
end
