note
	description: "Objects that represent an eCheck informatin"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=8"

class
	AN_ECHECK

feature -- Access

	bank_check_number: detachable STRING_32
			-- `bank_check_number'

	echeck_type: detachable AN_ECHECK_TYPE
			-- `echeck_type'

	bank_account_name: detachable STRING_32
			-- `bank_account_name'

	bank_name: detachable STRING_32
			-- `bank_name'

	bank_account_type: detachable AN_BANK_ACCOUNT_TYPE
			-- `bank_account_type'

	bank_account_number: detachable STRING_32
			-- `bank_account_number'

	routing_number: detachable STRING_32
			-- `routing_number'

feature -- Element change

	set_bank_check_number (a_bank_check_number: READABLE_STRING_32)
			-- Assign `bank_check_number' with `a_bank_check_number'.
		require
			is_valid_bank_check_number_length: a_bank_check_number.count <= 15
		do
			bank_check_number := a_bank_check_number
		ensure
			bank_check_number_assigned: bank_check_number = a_bank_check_number
		end

	set_echeck_type (an_echeck_type: like echeck_type)
			-- Assign `echeck_type' with `an_echeck_type'.
		do
			echeck_type := an_echeck_type
		ensure
			echeck_type_assigned: echeck_type = an_echeck_type
		end

	set_bank_account_name (a_bank_account_name: READABLE_STRING_32)
			-- Assign `bank_account_name' with `a_bank_account_name'.
		require
			is_valid_bank_account_length: a_bank_account_name.count <= 50
		do
			bank_account_name := a_bank_account_name
		ensure
			bank_account_name_assigned: bank_account_name = a_bank_account_name
		end

	set_bank_name (a_bank_name: READABLE_STRING_32)
			-- Assign `bank_name' with `a_bank_name'.
		require
			is_valid_bank_name_length: a_bank_name.count <= 50
		do
			bank_name := a_bank_name
		ensure
			bank_name_assigned: bank_name = a_bank_name
		end

	set_bank_account_type (a_bank_account_type: like bank_account_type)
			-- Assign `bank_account_type' with `a_bank_account_type'.
		do
			bank_account_type := a_bank_account_type
		ensure
			bank_account_type_assigned: bank_account_type = a_bank_account_type
		end

	set_bank_account_number (a_bank_account_number: READABLE_STRING_32)
			-- Assign `bank_account_number' with `a_bank_account_number'.
		require
			is_valid_account_number_length: a_bank_account_number.count <= 20
		do
			bank_account_number := a_bank_account_number
		ensure
			bank_account_number_assigned: bank_account_number = a_bank_account_number
		end

	set_routing_number (a_routing_number: READABLE_STRING_32)
			-- Assign `routing_number' with `a_routing_number'.
		require
			is_valid_routing_number_length: a_routing_number.count <= 9
		do
			routing_number := a_routing_number
		ensure
			routing_number_assigned: routing_number = a_routing_number
		end

end
