note
	description: "Objects that represent Bank account types. CHECKING, BUSINESSCHECKING,SAVINGS,UNKNOWN "
	author: ""
	date: "$Date: 2013-08-06 16:08:41 -0300 (mar, 06 ago 2013) $"
	revision: "$Revision: 192 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=8"

class
	AN_BANK_ACCOUNT_TYPE
create
	make

feature --{NONE}
	make
		do
			mark_checking
		end

feature -- Access

	account_type : INTEGER_32

	description : STRING_32

feature -- Status Report

	is_valid_type (s : INTEGER) : BOOLEAN
		do
		inspect s
				when checking, businesschecking, savings, unknown then
					Result := True
				else
				end
		end

	is_checking : BOOLEAN
		do
			Result := account_type = checking
		end

	is_businesschecking : BOOLEAN
		do
			Result := account_type = businesschecking
		end

	is_savings : BOOLEAN
		do
			Result := account_type = savings
		end

	is_unknown : BOOLEAN
		do
			Result := account_type = unknown
		end

feature -- Change Account Type

	set_account_type (a_account_type : INTEGER_32)
		require
			valid_market_type: is_valid_type (a_account_type)
		do
			account_type := a_account_type
			inspect a_account_type
				when checking then
					description := checking_value
				when businesschecking then
					description := businesschecking_value
				when savings then
					description := savings_value
				else
					description := unknown_value
				end
		ensure
			account_type_set : account_type = a_account_type
		end

	mark_checking
		do
			set_account_type (checking)
		ensure
			description_set : description.same_string (checking_value)
		end

	mark_businesschecking
		do
			set_account_type (businesschecking)
		ensure
			description_set : description.same_string (businesschecking_value)
		end

	mark_savings
		do
			set_account_type (savings)
		ensure
			description_set : description.same_string (savings_value)
		end


	mark_unknown
		do
			set_account_type (unknown)
		ensure
			description_set : description.same_string (unknown_value)
		end


feature -- Constants

	checking : INTEGER = 1
	checking_value : STRING_32 = "CHECKING"

	businesschecking : INTEGER = 2
	businesschecking_value : STRING_32 = "BUSINESSCHECKING"

	savings  : INTEGER = 3
	savings_value : STRING_32 ="SAVINGS"


	unknown : INTEGER = 4
	unknown_value  : STRING_32 = "UNKNOWN"

end
