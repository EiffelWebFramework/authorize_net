note
	description: "{AN_TRANSACTION_FACTORY}. transaction factory"
	author: ""
	date: "$Date: 2013-08-06 16:08:41 -0300 (mar, 06 ago 2013) $"
	revision: "$Revision: 192 $"

class
	AN_TRANSACTION_FACTORY

feature -- Factories

	new_aim_transaction (a_merchant: AN_MERCHANT; a_transaction_type: AN_TRANSACTION_TYPE; an_amount: DOUBLE): AN_AIM_TRANSACTION
			-- Create a new aim transaction
		do
			create {AN_AIM_TRANSACTION} Result.make (a_merchant, a_transaction_type, an_amount)
		end

end
