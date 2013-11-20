note
	description: "Objects that represent {AN_CREDIT_CARD}. a credit card"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=11"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=14"


class
	AN_CREDIT_CARD
create
	make

feature -- Initialization

	make (a_card_number : READABLE_STRING_32; a_expiration_date : READABLE_STRING_32)
		do
			set_credit_card_number (a_card_number)
			set_expiration_date (a_expiration_date)
		ensure
			credit_card_number_set : credit_card_number = a_card_number
			expiration_date_set : expiration_date = a_expiration_date
		end

feature -- Access
	Arb_expiry_date_format : STRING_32 = "yyyy-MM"

	Expiry_date_format : STRING_32 = "MM/yyyy"


	card_present: BOOLEAN
			-- `card_present'

	track2: detachable STRING_32
			-- `track2'

	track1: detachable STRING_32
			-- `track1'

	avs_code: detachable AN_AVS_CODE
			-- `avs_code'

	card_holder_authentication_value: detachable STRING_32
			-- `card_holder_authentication_value'

	card_holder_authentication_indicator: detachable STRING_32
			-- `card_holder_authentication_indicator'

	card_code: detachable STRING_32
			-- `card_code'
			-- The three- or four-digit number on the back of a credit card
			-- Notes: This field is required if the merchant would like to use the
			-- Card Code Verification (CCV) security feature

	card_type: detachable AN_CREDIT_CARD_TYPE
			-- `card_type'

	expiration_date: STRING_32
			-- `expiration_date'
			-- The customer's credit card expiration date
			-- Valid Formats:MMYY, MM/YY, MM-YY, MMYYYY, MM/YYYY, MMYYYY
			--| TODO : figure out how to validate this.

	expiration_year: detachable STRING_32
			-- `expiration_year'

	expiration_month: detachable STRING_32
			-- `expiration_month'

	credit_card_number: STRING_32 assign set_credit_card_number
			-- `credit_card_number'
			-- The customer's credit card number


feature -- Element change

	set_card_present (a_card_present: like card_present)
			-- Assign `card_present' with `a_card_present'.
		do
			card_present := a_card_present
		ensure
			card_present_assigned: card_present = a_card_present
		end

	set_track2 (a_track2: like track2)
			-- Assign `track2' with `a_track2'.
		do
			track2 := a_track2
		ensure
			track2_assigned: track2 = a_track2
		end

	set_track1 (a_track1: like track1)
			-- Assign `track1' with `a_track1'.
		do
			track1 := a_track1
		ensure
			track1_assigned: track1 = a_track1
		end

	set_avs_code (an_avs_code: like avs_code)
			-- Assign `avs_code' with `an_avs_code'.
		do
			avs_code := an_avs_code
		ensure
			avs_code_assigned: avs_code = an_avs_code
		end

	set_card_holder_authentication_value (a_card_holder_authentication_value: like card_holder_authentication_value)
			-- Assign `card_holder_authentication_value' with `a_card_holder_authentication_value'.
		do
			card_holder_authentication_value := a_card_holder_authentication_value
		ensure
			card_holder_authentication_value_assigned: card_holder_authentication_value = a_card_holder_authentication_value
		end

	set_card_holder_authentication_indicator (a_card_holder_authentication_indicator: like card_holder_authentication_indicator)
			-- Assign `card_holder_authentication_indicator' with `a_card_holder_authentication_indicator'.
		do
			card_holder_authentication_indicator := a_card_holder_authentication_indicator
		ensure
			card_holder_authentication_indicator_assigned: card_holder_authentication_indicator = a_card_holder_authentication_indicator
		end

	set_card_code (a_card_code: like card_code)
			-- Assign `card_code' with `a_card_code'.
		do
			card_code := a_card_code
		ensure
			card_code_assigned: card_code = a_card_code
		end

	set_card_type (a_card_type: like card_type)
			-- Assign `card_type' with `a_card_type'.
		do
			card_type := a_card_type
		ensure
			card_type_assigned: card_type = a_card_type
		end

	set_expiration_date (an_expiration_date: like expiration_date)
			-- Assign `expiration_date' with `an_expiration_date'.
		do
			expiration_date := an_expiration_date
		ensure
			expiration_date_assigned: expiration_date = an_expiration_date
		end

	set_expiration_year (an_expiration_year: like expiration_year)
			-- Assign `expiration_year' with `an_expiration_year'.
		do
			expiration_year := an_expiration_year
		ensure
			expiration_year_assigned: expiration_year = an_expiration_year
		end

	set_expiration_month (an_expiration_month: like expiration_month)
			-- Assign `expiration_month' with `an_expiration_month'.
		do
			expiration_month := an_expiration_month
		ensure
			expiration_month_assigned: expiration_month = an_expiration_month
		end

	set_credit_card_number (a_credit_card_number: like credit_card_number)
			-- Assign `credit_card_number' with `a_credit_card_number'.
		require
			valid_length : a_credit_card_number.count >= 13 and then  a_credit_card_number.count <= 16
		do
			credit_card_number := a_credit_card_number
		ensure
			credit_card_number_assigned: credit_card_number = a_credit_card_number
		end

end
