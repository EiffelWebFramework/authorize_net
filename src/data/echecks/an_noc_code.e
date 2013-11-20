note
	description: "[
					 ACH notice of change (NOC) codes that may be received from the customer's
		 			bank in the event of a discrepancy in the bank information provided with the transaction.
	]"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=22"

class
	AN_NOC_CODE

create
	make

feature {NONE} --  Initialization

	make (a_description: like description; a_noc_reason: like noc_reason; a_code: like code)
		do
			set_code (a_code)
			set_noc_reason (a_noc_reason)
			set_description (a_description)
		ensure
			code_set: code = a_code
			noc_reason_set: noc_reason = a_noc_reason
			description_set: description = a_description
		end

feature -- Access

	description: STRING_32
			-- `description'

	noc_reason: STRING_32
			-- `noc_reason'

	code: STRING_32
			-- `code'

feature -- Element change

	set_description (a_description: like description)
			-- Assign `description' with `a_description'.
		do
			description := a_description
		ensure
			description_assigned: description = a_description
		end

	set_noc_reason (a_noc_reason: like noc_reason)
			-- Assign `noc_reason' with `a_noc_reason'.
		do
			noc_reason := a_noc_reason
		ensure
			noc_reason_assigned: noc_reason = a_noc_reason
		end

	set_code (a_code: like code)
			-- Assign `code' with `a_code'.
		do
			code := a_code
		ensure
			code_assigned: code = a_code
		end

end
