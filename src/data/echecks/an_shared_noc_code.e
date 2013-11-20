note
	description: "Summary description for {AN_SHARED_NOC_CODE}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=eCheck Guide", "protocol=PDF", "src=http://www.authorize.net/support/eCheck.pdf", "page=22"
class
	AN_SHARED_NOC_CODE

feature -- Access

	C01 : AN_NOC_CODE
		once
			create Result.make ("C01", "Incorrect DFI account number", "The customer's bank account number is incorrect.")
		end

	C02 : AN_NOC_CODE
		once
			create Result.make ("C02", "Incorrect routing number", "The bank's ABA routing number is incorrect.")
		end

	C03 : AN_NOC_CODE
		once
			create Result.make ("C03", "Incorrect routing number and incorrect DFI account number", "The bank's ABA routing number is incorrect and as a result the bank account number structure is also incorrect.")
		end

	C04 : AN_NOC_CODE
		once
			create Result.make ("C04", "Incorrect individual name / receiving company name", "The individual or company name associated with the bank account is incorrect.")
		end

	C05 : AN_NOC_CODE
		once
			create Result.make ("C05", "Incorrect transaction code", "The transaction was submitted to a certain account type but includes a conflicting account type code (checking / savings).")
		end

	C06 : AN_NOC_CODE
		once
			create Result.make ("C06", "Incorrect DFI account number and incorrect transaction code", "The customer's bank account number is incorrect and the transaction should be submitted to a different account type (checking / savings).")
		end

	C07 : AN_NOC_CODE
		once
			create Result.make ("C07", "Incorrect routing number, incorrect DFI account number, and incorrect transaction code", "The bank's ABA routing number and the bank account number are incorrect; and the transaction was submitted to a certain account type but includes a conflicting account type code (checking / savings).")
		end

feature -- Noc codes

	Noc_codes : ARRAY[AN_NOC_CODE]
		once
			Result := <<C01, C02, C03, C04, C05, C06, C07>>
		end


	find_by_code ( code : READABLE_STRING_32) : detachable AN_NOC_CODE
		local
			i : INTEGER
			found : BOOLEAN
		do
			from
				i := 1
			until
				i > noc_codes.count or found
			loop
				if noc_codes.at (i).code.same_string (code) then
					Result :=  noc_codes.at (i)
					found := True
				end
				i := i + 1
			end
		end

end
