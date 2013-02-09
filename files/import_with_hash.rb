def import
		require 'csv'
		CSV.foreach("#{Rails.root}/files/test1.csv", :headers =>true) do |row|
			rowhash = row.to_hash
			if(rowhash["College code"])
			
				Rails.logger.info rowhash			
				if(College.where(:code=> rowhash["College code"]).exists?)
					college = College.find_by(:code=>rowhash["College code"])
				else
					college = College.create(:code => rowhash["College code"].strip,
																		:name => rowhash["College name"].strip,
																		:area => rowhash["College area"].strip,
																		:city=> rowhash["    City"].strip)
				end
				
				branch = college.branches.find_by(:name=> rowhash["Branch"].strip)														
				if(branch)
				else
					branch = college.branches.create(:name=> rowhash["Branch"].strip)
				end																		
		
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"OPEN",rowhash[OPEN_MALE_SCORE],rowhash[OPEN_FEMALE_SCORE],rowhash[OPEN_MALE_SML],rowhash[OPEN_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"SC",rowhash[SC_MALE_SCORE],rowhash[SC_FEMALE_SCORE],rowhash[SC_MALE_SML],rowhash[SC_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"ST",rowhash[ST_MALE_SCORE],rowhash[ST_FEMALE_SCORE],rowhash[ST_MALE_SML],rowhash[ST_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"VJ",rowhash[VJ_MALE_SCORE],rowhash[VJ_FEMALE_SCORE],rowhash[VJ_MALE_SML],rowhash[VJ_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"NT1",rowhash[NT1_MALE_SCORE],rowhash[NT1_FEMALE_SCORE],rowhash[NT1_MALE_SML],rowhash[NT1_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"NT2",rowhash[NT2_MALE_SCORE],rowhash[NT2_FEMALE_SCORE],rowhash[NT2_MALE_SML],rowhash[NT2_FEMALE_SML])
				
				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"NT3",rowhash[NT3_MALE_SCORE],rowhash[NT3_FEMALE_SCORE],rowhash[NT3_MALE_SML],rowhash[NT3_FEMALE_SML])

				create_cutoff(branch.cutoffs,rowhash[U_ROUND],rowhash[SHIFT],rowhash[AIEEE_RANK],rowhash[AIEEE_SCORE],"OBC",rowhash[OBC_MALE_SCORE],rowhash[OBC_FEMALE_SCORE],rowhash[OBC_MALE_SML],rowhash[OBC_FEMALE_SML])
					
			end
														
		end	
	end
