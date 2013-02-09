module CutoffsHelper

	def create_cutoff(cutoffs,round,shift,aieee_rank,aieee_score,caste,male_score,male_sml_rank,female_score,female_sml_rank,male_score_ou,male_sml_rank_ou,female_score_ou,female_sml_rank_ou)
		
		cutoffs.create(:round=> round.strip,
														:shift=>shift,
														:aieee_rank => aieee_rank.strip,
														:aieee_score => aieee_score.strip,
														:caste=> caste,
														:male_score=> male_score.strip,
														:female_score=> female_score.strip,
														:male_sml_rank=> male_sml_rank.strip,
														:female_sml_rank=>female_sml_rank.strip,
														:male_score_ou => male_score_ou.strip,
														:female_score_ou=> female_score_ou.strip,
														:male_sml_rank_ou=>male_sml_rank_ou.strip,
														:female_sml_rank_ou=>female_sml_rank_ou.strip)
		return cutoffs
	end
	
end
