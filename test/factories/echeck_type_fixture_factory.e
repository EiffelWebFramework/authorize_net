note
	description: "Summary description for {ECHECK_TYPE_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-11 09:18:33 -0300 (mar 11 de jun de 2013) $"
	revision: "$Revision: 32 $"

class
	ECHECK_TYPE_FIXTURE_FACTORY
feature -- Factories
	default_echeck_type : AN_ECHECK_TYPE
		do
			create Result.make
		end

	echeck_type_web : AN_ECHECK_TYPE
		do
			Result := default_echeck_type
			Result.mark_web
		end
end
