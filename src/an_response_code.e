note
	description: "Objects that represent a response code, with possible values of approved, declined, error, or held for review"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=49"
class
	AN_RESPONSE_CODE

create
	make

feature {NONE} -- Initialization

	make
			-- Create an Object response code with status error by default
		do
			mark_error
		end

feature -- Access

	code: INTEGER
			-- response code

	description: STRING_32
			-- response description

feature -- Status Report

	is_valid_code (s: INTEGER): BOOLEAN
		do
			inspect s
			when Approved, Declined, Error, Review, Unknown then
				Result := True
			else
			end
		end

	is_approved	: BOOLEAN
		do
			Result := code = Approved
		end

	is_declined	: BOOLEAN
		do
			Result := code = Declined
		end

	is_error : BOOLEAN
		do
			Result := code = Error
		end

	is_review : BOOLEAN
		do
			Result := code = Review
		end

	is_unknown : BOOLEAN
		do
			Result := code = Unknown
		end


feature -- Change element

	set_response_code (a_code: INTEGER_32)
		require
			valid_response: is_valid_code (a_code)
		do
			code := a_code
			inspect a_code
			when approved then
				description := Approved_description
			when declined then
				description := Declined_description
			when error then
				description := Error_description
			when review then
				description := Review_description
			else
				description := Unknown_description
			end
		ensure
			code_set: code = a_code
		end

	mark_approved
		do
			set_response_code (Approved)
		ensure
			description_set: description.same_string (Approved_description)
		end

	mark_declined
		do
			set_response_code (Declined)
		ensure
			description_set: description.same_string (Declined_description)
		end

	mark_error
		do
			set_response_code (Error)
		ensure
			description_set: description.same_string (Error_description)
		end

	mark_review
		do
			set_response_code (Review)
		ensure
			description_set: description.same_string (Review_description)
		end


	mark_unknown
		do
			set_response_code (Unknown)
		ensure
			description_set: description.same_string (Unknown_description)
		end


feature -- Constants

	Approved: INTEGER = 1

	Approved_description: STRING_32 = "This transaction has been approved."

	Declined: INTEGER = 2

	Declined_description: STRING_32 = "This transaction has been declined"

	Error: INTEGER = 3

	Error_description: STRING_32 = "There has been an error processing this transaction."

	Review: INTEGER = 4

	Review_description: STRING_32 = "This transaction is being held for review."

	Unknown: INTEGER = 0

	Unknown_description: STRING_32 = "Unknown."


invariant
	code_set: is_valid_code (code)

end
