note
	description: "Summary description for {ECHECK_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-11 09:18:33 -0300 (mar 11 de jun de 2013) $"
	revision: "$Revision: 32 $"

class
	ECHECK_FIXTURE_FACTORY

feature -- Factories

	default_echeck : AN_ECHECK
		do
			create Result
		end

	echeck_1 : AN_ECHECK
		do
			Result := default_echeck
			Result.set_bank_account_name ("Test Checking")
			Result.set_bank_account_number ("1234567890")
			Result.set_bank_account_type ((create{BANK_ACCOUNT_TYPE_FIXTURE_FACTORY}).default_bank_account_type)
			Result.set_bank_check_number ("1001")
			Result.set_bank_name ("Bank of America")
			Result.set_echeck_type ((create {ECHECK_TYPE_FIXTURE_FACTORY}).echeck_type_web)
			Result.set_routing_number ("111000025")
		end

end
