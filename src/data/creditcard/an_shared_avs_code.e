note
	description: "{AN_SHARED_AVS_CODE} AVS codes, The result codes are, A, B, E, G, N, P, R, S, U, W, Y, Z."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=21"
class
	AN_SHARED_AVS_CODE

feature -- Access

	Code_a : AN_AVS_CODE
		once
			create Result.make ("A","Address (Street) matches, ZIP does not")
		end

	Code_b : AN_AVS_CODE
		once
			create Result.make ("B", "Address information not provided for AVS check")
		end

	Code_e : AN_AVS_CODE
		once
			create Result.make ("E", "AVS error")
		end

	Code_g : AN_AVS_CODE
		once
			create Result.make ("G", "Non-U.S. Card Issuing Bank")
		end

	Code_n : AN_AVS_CODE
		once
			create Result.make ("N", "No Match on Address (Street) or ZIP")
		end

	Code_p : AN_AVS_CODE
		once
			create Result.make ("P", "AVS not applicable for this transaction")
		end

	Code_r : AN_AVS_CODE
		once
			create Result.make ("R", "Retry - System unavailable or timed out")
		end

	Code_s : AN_AVS_CODE
		once
			create Result.make ("S", "Service not supported by issuer")
		end

	Code_u : AN_AVS_CODE
		once
			create Result.make ("U", "Address information is unavailable")
		end

	Code_w : AN_AVS_CODE
		once
			create Result.make ("W", "Nine digit ZIP matches, Address (Street) does not")
		end


	Code_x : AN_AVS_CODE
		once
			create Result.make ("X", "Address (Street) and nine digit ZIP match")
		end

	Code_y : AN_AVS_CODE
		once
			create Result.make ("Y", "Address (Street) and five digit ZIP match")
		end

	Code_z : AN_AVS_CODE
		once
			create Result.make ("Z", "Five digit ZIP matches, Address (Street) does not")
		end

end
