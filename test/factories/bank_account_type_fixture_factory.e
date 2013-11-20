note
	description: "Summary description for {BANK_ACCOUNT_TYPE_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-11 09:18:33 -0300 (mar 11 de jun de 2013) $"
	revision: "$Revision: 32 $"

class
	BANK_ACCOUNT_TYPE_FIXTURE_FACTORY

feature -- Factories
	default_bank_account_type : AN_BANK_ACCOUNT_TYPE
		do
			create Result.make
		end

end
