note
	description: "Objects that represent a transaction executor"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"

class
	AN_TRANSACTION_EXECUTOR

create
	make

feature -- Initialization

	make (a_merchant: AN_MERCHANT; a_transaction: AN_TRANSACTION)
		do
			merchant := a_merchant
			transaction := a_transaction
		ensure
			mechant_set : merchant = a_merchant
			transaction_set : transaction = a_transaction
		end

feature -- Access

	merchant: AN_MERCHANT

	transaction: AN_TRANSACTION

feature -- Execute a transaction

	execute_aim_transaction: AN_RESPONSE
			-- execute an aim transaction
		local
			l_operation: AN_TRANSACTION_OPERATION
		do
			create l_operation.make (merchant.environment.gateway)
			Result := l_operation.post_aim_transaction (transaction)
		end

end
