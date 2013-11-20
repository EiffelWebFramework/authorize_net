note
	description: "Summary description for {AN_SHARED_RETURN_CODE}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "sRc=http://www.authorize.net/support/eCheck.pdf", "page=16"
class
	AN_SHARED_RETURN_CODE

feature -- Access

	Rc01: AN_RETURN_CODE
		do
			create Result.make ("R01", "Insufficient Funds (NSF)", "Insufficient Funds")
		end

	Rc02: AN_RETURN_CODE
		do
			create Result.make ("R02", "Administrative Return", "Account Closed")
		end

	Rc03: AN_RETURN_CODE
		do
			create Result.make ("R03", "Administrative Return", "No Account/Unable to Locate Account")
		end

	Rc04: AN_RETURN_CODE
		do
			create Result.make ("R04", "Administrative Return", "Invalid Account Number")
		end

	Rc05: AN_RETURN_CODE
		do
			create Result.make ("R05", "Administrative Return", "Unauthorized Debit to Consumer Account Using Corporate SEC Code")
		end

	Rc06: AN_RETURN_CODE
		do
			create Result.make ("R06", "Administrative Return", "Returned per ODFI Request")
		end

	Rc07: AN_RETURN_CODE
		do
			create Result.make ("R07", "Chargeback", "Authorization Revoked by Customer")
		end

	Rc08: AN_RETURN_CODE
		do
			create Result.make ("R08", "Chargeback", "Payment Stopped by Customer")
		end

	Rc09: AN_RETURN_CODE
		do
			create Result.make ("R09", "Insufficient Funds (NSF)", "Uncollected Funds")
		end

	Rc10: AN_RETURN_CODE
		do
			create Result.make ("R10", "Chargeback", "Customer Advises Unauthorized")
		end

	Rc12: AN_RETURN_CODE
		do
			create Result.make ("R12", "Administrative Return", "Branch Sold to Another DFI")
		end

	Rc13: AN_RETURN_CODE
		do
			create Result.make ("R13", "Administrative Return", "RDFI Not Qualified to Participate")
		end

	Rc14: AN_RETURN_CODE
		do
			create Result.make ("R14", "Administrative Return", "Representativ e Payee Deceased")
		end

	Rc15: AN_RETURN_CODE
		do
			create Result.make ("R15", "Administrative Return", "Beneficiary or Account Holder Deceased")
		end

	Rc16: AN_RETURN_CODE
		do
			create Result.make ("R16", "Administrative Return", "Account Frozen")
		end

	Rc17: AN_RETURN_CODE
		do
			create Result.make ("R17", "Administrative Return", "RDFI Cannot Process")
		end

	Rc20: AN_RETURN_CODE
		do
			create Result.make ("R20", "Administrative Return", "Non- Transaction Account")
		end

	Rc23: AN_RETURN_CODE
		do
			create Result.make ("R23", "Administrative Return", "Credit Refused by Customer")
		end

	Rc24: AN_RETURN_CODE
		do
			create Result.make ("R24", "Administrative Return", "Duplicate Entry")
		end

	Rc29: AN_RETURN_CODE
		do
			create Result.make ("R29", "Chargeback", "Corporate Customer Advises Not Authorized")
		end

	Rc30: AN_RETURN_CODE
		do
			create Result.make ("R30", "Administrative Return", "RDFI is Not an ACH Participant")
		end

	Rc31: AN_RETURN_CODE
		do
			create Result.make ("R31", "Administrative Return", "Permissible Return")
		end

	Rc32: AN_RETURN_CODE
		do
			create Result.make ("R32", "Administrative Return", "RDFI is not a Settlement RDFI")
		end

	Rc34: AN_RETURN_CODE
		do
			create Result.make ("R34", "Administrative Return", "RDFI not Qualified to Participate")
		end

	Rc35: AN_RETURN_CODE
		do
			create Result.make ("R35", "Administrative Return", "Return of Improper Debit Entry")
		end

	Rc36: AN_RETURN_CODE
		do
			create Result.make ("R36", "Administrative Return", "Return of Improper Credit Entry")
		end

feature -- Return Code

	Return_codes: ARRAY [AN_RETURN_CODE]
		once
			Result := <<Rc01, Rc02, Rc03, Rc04, Rc05, Rc06, Rc07, Rc08, Rc09, Rc10, Rc12, Rc13, Rc14, Rc15, Rc16, Rc17, Rc20, Rc23, Rc24, Rc29, Rc30, Rc31, Rc32, Rc34, Rc35, Rc36>>
		end


	find_by_code ( code : STRING) : detachable AN_RETURN_CODE
		local
			i : INTEGER
			found : BOOLEAN
		do
			from
				i := 1
			until
				i > return_codes.count or found
			loop
				if return_codes.at (i).code.same_string (code) then
					Result :=  return_codes.at (i)
					found := True
				end
				i := i + 1
			end
		end

end
