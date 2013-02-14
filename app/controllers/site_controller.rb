class SiteController < ApplicationController
	include  CutoffsHelper

	def index
		@collges = College.all
	end

	def showupload
	end

	def upload
  	uploaded_io = params[:csvfilename]
    	@filename = uploaded_io.original_filename
  		File.open(Rails.root.join('public', 'uploads',@filename ), 'w') do |file|
    	file.write(uploaded_io.read)
  	end
  	@filepath = "#{Rails.root}/public/uploads/#{@filename}"
  	import
	end

	def import
		require 'csv'
		filerootpath = "#{Rails.root}/files/csv/" 
		Dir.entries(filerootpath).each do |filename|
			if (!File.directory?(filename) and File.extname(filename) == ".csv")
				filepath = "#{filerootpath}/#{filename}"
				CSV.foreach(filepath) do |row|
					if(row[0] != "College code" && row[0] != nil)
			
						Rails.logger.info row			
						if(College.where(:code=> row[0]).exists?)
							college = College.find_by(:code=>row[0])
						else
							college = College.create(:code => row[0].strip,
																				:name => row[1].strip,
																				:area => row[6].strip,
																				:city=> row[7].strip)
						end
				
						branch = college.branches.find_by(:name=> row[8].strip)														
						if(branch)
						else
							branch = college.branches.create(:name=> row[8].strip)
						end																		
		
						# 0 = college code, 1 = college name , 6 = college area, 7 = 	city, 8= branch, 9 = round, 10 = shift , 11 = aieee rank, 12 = aieee score
						# 13 = open male score, 14 = open male sml, 15 = open female score, 16= open female sml, 17= sc male score, 18= sc male sml, 19 = sc female score
						# 20= sc female sml, 21 = st male score, 22 = st male sml, 23 = st female score, 24= st female sml
						# 25= vj male score, 26= vj male sml, 27= vj female score, 28= vj female sml 
						# 29= nt1 male score, 30= nt1 male sml, 31= nt1 female score, 32= nt1 female sml
						# 33= nt2 male score, 34= nt2 male sml, 35= nt2 female score, 36= nt2 female sml
						# 37= nt3 male score, 38= nt3 male sml, 39= nt3 female score, 40= nt3 female sml
						# 41= obc male score, 42= obc male sml, 43= obc female score, 44= obc female sml
				
						# 49= open male score ou, 50 = open male sml ou, 51 = open female score, 52 = open female sml
				
				
				
		
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"OPEN",row[13],row[14],row[15],row[16],row[49],row[50],row[51],row[52])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"SC",row[17],row[18],row[19],row[20],row[53],row[54],row[55],row[56])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"ST",row[21],row[22],row[23],row[24],row[57],row[58],row[59],row[60])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"VJ",row[25],row[26],row[27],row[28],row[61],row[62],row[63],row[64])

						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"NT1",row[29],row[30],row[31],row[32],row[65],row[66],row[67],row[68])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"NT2",row[33],row[34],row[35],row[36],row[69],row[70],row[71],row[72])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"NT3",row[37],row[38],row[39],row[40],row[73],row[74],row[75],row[76])
				
						create_cutoff(branch.cutoffs,row[9],row[10],row[11],row[12],"OBC",row[41],row[42],row[43],row[44],row[77],row[78],row[79],row[80])												
					
					end
														
				end	
			end	
		end	
	end

	def importfile
		
	end
	
	def search
	
		student = Student.first
	
		Rails.logger.info "College id: #{params[:college_id]}"
		search_hash = {:college_id => params[:college_id],:branch=> params[:branch_id],:round => params[:round],:caste=>student.caste,:exam_type => params[:exam_type],:marks_type=>params[:marks_type],:score_value => params[:score_value]}
		
		
		
		@college = College.find_by(:id=> search_hash[:college_id])
		
		Rails.logger.info "College Name: #{@college.name}"
		
		@branch = @college.branches.where(:name => search_hash[:branch]).first
		
		if(@branch)
			Rails.logger.info "******** found branch"
			cutoff_filter = {:caste => search_hash[:caste],:round => search_hash[:round]}
			#@cutoffs = @branch.cutoffs.where()
			
			if(student.gender == "Male")
				#cutoff_filter = get_filter_score_and_rank(search_hash[:exam_type],search_hash[:marks_type],search_hash)
				gender = "male"
				if(search_hash[:exam_type] == "MHCET")
					if (search_hash[:marks_type] == "Score")
						cutoff_filter[:male_score.lte] = search_hash[:score_value]		
					else
						cutoff_filter[:male_sml_rank.gte] = search_hash[:score_value]
						#TODO
					end
				else
					if(search_hash[:marks_type] == "Score")
						cutoff_filter[:aieee_score.lte] = search_hash[:score_value]
						#TODO
					else
						cutoff_filter[:aieee_rank.gte] = search_hash[:score_value]
					end
				end
			else
				# TODO	
			end
			Rails.logger.info "*********** Cutoff Filter : #{cutoff_filter}"
			@cutoffs = @branch.cutoffs.where(cutoff_filter)	
		else
			Rails.logger.info "******** branch not found"
			@cutoffs = []	
		end	
		
		@foundcutoff = @cutoffs.first
	end
	
	
#2013021215148	
	
end
