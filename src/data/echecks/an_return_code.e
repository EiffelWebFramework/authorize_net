note
	description: "Summary description for {AN_RETURN_CODE}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=16"
class
	AN_RETURN_CODE

create
	make

feature {NONE} -- Initialization

	make (a_short_title : like short_title; a_return_type : like return_type; a_code : like code)
		do
			set_code (a_code)
			set_short_title (a_short_title)
			set_return_type (a_return_type)
		ensure
			code_set : code = a_code
			short_title_set : short_title = a_short_title
			return_type_set : return_type = a_return_type
		end

feature -- Access

	short_title: STRING_32
			-- `short_title'

	return_type: STRING_32
			-- `return_type'

	code: STRING_32
			-- `code'

feature -- Element change

	set_short_title (a_short_title: like short_title)
			-- Assign `short_title' with `a_short_title'.
		do
			short_title := a_short_title
		ensure
			short_title_assigned: short_title = a_short_title
		end

	set_return_type (a_return_type: like return_type)
			-- Assign `return_type' with `a_return_type'.
		do
			return_type := a_return_type
		ensure
			return_type_assigned: return_type = a_return_type
		end

	set_code (a_code: like code)
			-- Assign `code' with `a_code'.
		do
			code := a_code
		ensure
			code_assigned: code = a_code
		end

end
