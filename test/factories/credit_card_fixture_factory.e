note
	description: "Summary description for {CREDIT_CARD_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-10 14:17:31 -0300 (lun 10 de jun de 2013) $"
	revision: "$Revision: 29 $"

class
	CREDIT_CARD_FIXTURE_FACTORY

feature -- Factories

	default_credit_card : AN_CREDIT_CARD
		do
			create Result.make ("370000000000002", "052020")
		end

end
