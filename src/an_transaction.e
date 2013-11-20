note
	description: "Object that represent an abstract transaction"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=23"

deferred class
	AN_TRANSACTION

feature -- Access

	field_delimiter: STRING_32

	encap_char_delimiter: STRING_32

feature -- Change Elements

	set_field_delimiter (a_field_delimiter: READABLE_STRING_32)
			-- Character used to separate fields in the transaction response.
		do
			field_delimiter := a_field_delimiter
		ensure
			field_delimiter_set: field_delimiter = a_field_delimiter
		end

	set_encap_char_delimiter (a_char_delimiter: READABLE_STRING_32)
			-- Character used to encapsulate fields in the transaction response
		do
			encap_char_delimiter := a_char_delimiter
		ensure
			encap_char_delimiter_set: encap_char_delimiter = a_char_delimiter
		end

feature -- Process

	build_request_mapping_as_nvp: STRING_32
			-- Prepare the name/value pair mapping.
		deferred
		end

end
