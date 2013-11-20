note
	description: "Objects that represent a transaction response"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=39"

class
	AN_RESPONSE

--Payment Gateway Response
create
	make

feature {NONE} -- Initialization

	make (a_transaction : like  transaction; a_response_fields : like response_fields)
		do
			transaction := a_transaction
			response_fields := a_response_fields
		ensure
			transaction_set : transaction = a_transaction
			response_fields_set : response_fields = a_response_fields
		end

feature -- Access

	transaction : AN_TRANSACTION
		-- `associated transaction'

	response_reason_codes: AN_RESPONSE_REASON_CODE
			-- `response_reason_codes'
			-- http://developer.authorize.net/tools/responsereasoncode/
			do
				Result := (create {AN_SHARED_RESPONSE_REASON_CODE}).rrc_0_0
				if attached response_fields.at ("RESPONSE_REASON_CODE") as l_response_reason_code and then
				   l_response_reason_code.is_integer then
					Result := (create {AN_SHARED_RESPONSE_REASON_CODE}).find_by_reason_code (l_response_reason_code.to_integer)
				end
			end

	response_code: AN_RESPONSE_CODE
			-- `response_code'
		do
			create Result.make
			if attached response_fields.at ("RESPONSE_CODE") as l_response_code and then
			   l_response_code.is_integer then
				if Result.is_valid_code (l_response_code.to_integer) then
					Result.set_response_code (l_response_code.to_integer)
				end
			end
		end

	response_text : detachable READABLE_STRING_GENERAL
			-- `response_text'
		do
			Result := response_fields.at ("RESPONSE_REASON_TEXT")
		end

	response_fields : STRING_TABLE [READABLE_STRING_GENERAL]
			-- `response_fields'

end
