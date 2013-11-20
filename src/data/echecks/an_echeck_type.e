note
	description: "[
		Objects that represent 	eCheck.Net transaction types supported by the Authorize.Net Payment Gateway
		  ARC - Accounts Receivable Conversion
		  BOC - Back Office Conversion
		  CCD - Cash Concentration or Disbursement
		  PPD - Prearranged Payment and Deposit Entry
		  TEL - Telephone-Initiated Entry
		  WEB - Internet-Initiated Entry
	]"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=8"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=10"

class
	AN_ECHECK_TYPE

create
	make

feature --{NONE}

	make
		do
			mark_unknown
		end

feature -- Access

	echeck_type: INTEGER

	echeck_value: STRING_32

feature -- Status Report

	is_valid_type (s: INTEGER): BOOLEAN
		do
			inspect s
			when Arc, Boc, Ccd, Ppd, Tel, Web, Unknown then
				Result := True
			else
			end
		end

	is_arc: BOOLEAN
		do
			Result := echeck_type = Arc
		end

	is_boc: BOOLEAN
		do
			Result := echeck_type = Boc
		end

	is_ccd: BOOLEAN
		do
			Result := echeck_type = Ccd
		end

	is_ppd: BOOLEAN
		do
			Result := echeck_type = Ppd
		end

	is_tel: BOOLEAN
		do
			Result := echeck_type = Tel
		end

	is_web: BOOLEAN
		do
			Result := echeck_type = Web
		end

	is_unknown: BOOLEAN
		do
			Result := echeck_type = Unknown
		end

feature -- Change Echeck Type

	set_echeck_type (a_echeck_type: INTEGER_32)
		require
			valid_echeck_type: is_valid_type (a_echeck_type)
		do
			echeck_type := a_echeck_type
			inspect a_echeck_type
			when arc then
				echeck_value := Arc_value
			when boc then
				echeck_value := Boc_value
			when ccd then
				echeck_value := Ccd_value
			when ppd then
				echeck_value := Ppd_value
			when tel then
				echeck_value := Tel_value
			when web then
				echeck_value := Web_value
			else
				echeck_value := Unknown_value
			end
		ensure
			echeck_type_set: echeck_type = a_echeck_type
		end

	mark_arc
		do
			set_echeck_type (Arc)
		ensure
			echeck_set: echeck_value.same_string (Arc_value)
		end

	mark_boc
		do
			set_echeck_type (Boc)
		ensure
			echeck_set: echeck_value.same_string (Boc_value)
		end

	mark_ccd
		do
			set_echeck_type (Ccd)
		ensure
			echeck_set: echeck_value.same_string (Ccd_value)
		end

	mark_ppd
		do
			set_echeck_type (Ppd)
		ensure
			echeck_set: echeck_value.same_string (Ppd_value)
		end

	mark_tel
		do
			set_echeck_type (Tel)
		ensure
			echeck_set: echeck_value.same_string (Tel_value)
		end

	mark_web
		do
			set_echeck_type (Web)
		ensure
			echeck_set: echeck_value.same_string (Web_value)
		end

	mark_unknown
		do
			set_echeck_type (Unknown)
		ensure
			echeck_set: echeck_value.same_string (Unknown_value)
		end

feature --Constants

	Arc: INTEGER = 1

	Arc_value: STRING_32 = "ARC"

	Boc: INTEGER = 2

	Boc_value: STRING_32 = "BOC"

	Ccd: INTEGER = 3

	Ccd_value: STRING_32 = "CCD"

	Ppd: INTEGER = 4

	Ppd_value: STRING_32 = "PPD"

	Tel: INTEGER = 5

	Tel_value: STRING_32 = "TEL"

	Web: INTEGER = 6

	Web_value: STRING_32 = "WEB"

	Unknown: INTEGER = 7

	Unknown_value: STRING_32 = "UNKNOWN"

invariant
	echeck_type_set: is_valid_type (echeck_type)

end
