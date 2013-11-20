note
	description: "Objects that represent response details"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=48"

class
	AN_RESPONSE_REASON_CODE

create
	make

feature {NONE} --Initialization

	make (a_response_code: AN_RESPONSE_CODE; id: INTEGER; a_description: READABLE_STRING_32; a_comment: READABLE_STRING_32)
		do
			response_code := a_response_code
			code := id
			description := a_description
			comment := a_comment
		ensure
			response_code_set: response_code = a_response_code
			code_set: code = id
			description_set: description = a_description
			comment_set: comment = a_comment
		end

feature -- Access

	response_code: AN_RESPONSE_CODE
		--  Overall status of the transaction with possible values of
		--	approved, declined, errored, or held for review.

	code: INTEGER
		-- Numeric representation.

	description: STRING_32
		-- Details the specific reason for the transaction status.

	comment: STRING_32
		-- Aditional notes for the transaction status.
end
