note
	description: "Object that represent the method of payment, Credit card or Electronic Checks"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"

class
	AN_PAYMENT_METHOD

create
	make

feature --{NONE}

	make
		do
			mark_credit_card
		end

feature -- Access

	method: INTEGER_32

	method_value: STRING_32

feature -- Status Report

	is_valid_method (s: INTEGER): BOOLEAN
		do
			inspect s
			when Credit_card, E_check, Unknown then
				Result := True
			else
			end
		end

	is_credit_card: BOOLEAN
		do
			Result := method = Credit_card
		end

	is_e_check: BOOLEAN
		do
			Result := method = E_check
		end

	is_unknown: BOOLEAN
		do
			Result := method = Unknown
		end

feature -- Change Market Type

	set_payment_method (a_method: INTEGER_32)
		require
			valid_payment_method: is_valid_method (a_method)
		do
			method := a_method
			inspect a_method
			when credit_card then
				method_value := Credit_card_value
			when e_check then
				method_value := E_check_value
			else
				method_value := Unknown_value
			end
		ensure
			method_set: method = a_method
		end

	mark_credit_card
		do
			set_payment_method (Credit_card)
		ensure
			method_value_set: method_value.same_string (Credit_card_value)
		end

	mark_e_check
		do
			set_payment_method (E_check)
		ensure
			method_value_set: method_value.same_string (E_check_value)
		end

	mark_unknown
		do
			set_payment_method (Unknown)
		ensure
			method_value_set: method_value.same_string (Unknown_value)
		end

feature -- Constants

	Credit_card: INTEGER = 1

	Credit_card_value: STRING_32 = "CC"

	E_check: INTEGER = 2

	E_check_value: STRING_32 = "ECHECK"

	Unknown: INTEGER = 3

	Unknown_value: STRING_32 = "UNKNOWN"

invariant
	method_set: is_valid_method (method)
end
