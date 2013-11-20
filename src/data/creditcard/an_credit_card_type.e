note
	description: "Object that represent credit card types {AN_CREDIT_CARD_TYPE}, American Express, Diners Club, Discover, JCB, Mastercard, Visa "
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=10"

class
	AN_CREDIT_CARD_TYPE

create
	make

feature {NONE} -- Initialization

	make
		do
			mark_visa
		end

feature -- Access

	card_type: INTEGER

	card_description: STRING_32

feature -- Status Report

	is_valid_type (s: INTEGER): BOOLEAN
		do
			inspect s
			when Visa, Master_card, American_express, Discover, Diners_club, Jcb, Echeck, Unknown then
				Result := True
			else
			end
		end

	is_visa: BOOLEAN
		do
			Result := Visa = card_type
		end

	is_master_card : BOOLEAN
		do
			Result := Master_card = card_type
		end

	is_american_express : BOOLEAN
		do
			Result := American_express = card_type
		end

	is_discover	: BOOLEAN
		do
			Result :=  Discover = card_type
		end

	is_diners_club : BOOLEAN
		do
			Result := Diners_club = card_type
		end

	is_jcb : BOOLEAN
		do
			Result := Jcb = card_type
		end

	is_echeck : BOOLEAN
		do
			Result := Echeck = card_type
		end

	is_unknown : BOOLEAN
		do
			Result := Unknown = card_type
		end

feature -- Change Card Type

	set_card_type (s: INTEGER)
			--
		require
			is_valid_card: is_valid_type (s)
		do
			card_type := s
		ensure
			card_type_set: card_type = s
		end

	mark_visa
		do
			set_card_type (Visa)
			card_description := Visa_description
		ensure
			card_description_set: card_description = Visa_description
		end

	mark_master_card
		do
			set_card_type (Master_card)
			card_description := Master_card_description
		ensure
			card_description_set: card_description = Master_card_description
		end

	mark_american_express
		do
			set_card_type (American_express)
			card_description := American_express_description
		ensure
			card_description_set: card_description = American_express_description
		end

	mark_discover
		do
			set_card_type (Discover)
			card_description := Discover_description
		ensure
			card_description_set: card_description = Discover_description
		end

	mark_diners_club
		do
			set_card_type (Diners_club)
			card_description := Diners_club_description
		ensure
			card_description_set: card_description = Diners_club_description
		end

	mark_jcb
		do
			set_card_type (Jcb)
			card_description := Jcb_description
		ensure
			card_description_set: card_description = Jcb_description
		end

	mark_echeck
		do
			set_card_type (Echeck)
			card_description := Echeck_description
		ensure
			card_description_set: card_description = Echeck_description
		end

	mark_unknown
		do
			set_card_type (Unknown)
			card_description := Unknown_description
		ensure
			card_description_set: card_description = Unknown_description
		end
feature -- Constants

	Visa: INTEGER = 1

	Visa_description: STRING_32 = "Visa"

	Master_card: INTEGER = 2

	Master_card_description: STRING_32 = "MasterCard"

	American_express: INTEGER = 3

	American_express_description: STRING_32 = "American Express"

	Discover: INTEGER = 4

	Discover_description: STRING_32 = "Discover"

	Diners_club: INTEGER = 5

	Diners_club_description: STRING_32 = "Diners Club"

	Jcb: INTEGER = 6

	Jcb_description: STRING_32 = "JCB"

	Echeck: INTEGER = 7

	Echeck_description: STRING_32 = "eCheck"

	Unknown: INTEGER = 8

	Unknown_description: STRING_32 = ""

invariant
	card_type_set: is_valid_type (card_type)
end
