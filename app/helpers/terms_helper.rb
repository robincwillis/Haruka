module TermsHelper

def accuracy(term)
	up_votes 	= term.votes_for
	down_votes 	= term.votes_against
	votes = up_votes + down_votes

	accuracy = number_with_precision((up_votes.to_f - down_votes.to_f) / votes, :precision => 2)
	a = accuracy.to_f  * 100
	number_to_percentage(a, :precision => 0)

end

end
