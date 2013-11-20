note
	description: "Objects that describe an Address Verification Service."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=21"

class
	AN_AVS_CODE

create
	make

feature {NONE} -- Initialization

	make (a_value : READABLE_STRING_32; a_description : READABLE_STRING_32)
		do
			set_value (a_value)
			set_description (a_description)
		ensure
			value_set: value = a_value
			description_set : description = a_description
		end

feature -- Access

	description: STRING_32
			-- `description'

	value: STRING_32
			-- `value'

feature -- Element change

	set_description (a_description: like description)
			-- Assign `description' with `a_description'.
		do
			description := a_description
		ensure
			description_assigned: description = a_description
		end

	set_value (a_value: like value)
			-- Assign `value' with `a_value'.
		do
			value := a_value
		ensure
			value_assigned: value = a_value
		end

end
