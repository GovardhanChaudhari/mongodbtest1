require 'find'
require 'rubyXL'

count = 0

Find.find('./sheets/') do |file|             # begin iteration of each file of a specified directory
  if file =~ /\b.xlsx$\b/                                  # check if file is xlsx format
    workbook = RubyXL::Parser.parse(file).worksheets       # creates an object containing all worksheets of an excel workbook
    workbook.each do |worksheet|                           # begin iteration over each worksheet
      data = worksheet.extract_data.to_s                   # extract data of a given worksheet - must be converted to a string in order to match a regex
      if data =~ /regex/
        puts file
        count += 1
      end      
    end
  end
end

puts "#{count} files were found"
