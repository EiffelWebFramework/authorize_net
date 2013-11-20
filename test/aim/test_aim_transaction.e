note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date: 2013-07-31 20:57:13 -0300 (mié, 31 jul 2013) $"
	revision: "$Revision: 190 $"
	testing: "type/manual"

class
	TEST_AIM_TRANSACTION

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end
	AN_SHARED_RESPONSE_REASON_CODE
		undefine
			default_create
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do

		end

	on_clean
			-- <Precursor>
		do

		end

feature -- Test routines

	test_credict_card_auth_capture
		local
			a_merchant: AN_MERCHANT
			l_executor: AN_TRANSACTION_EXECUTOR
			l_transaction: AN_AIM_TRANSACTION
			l_transaction_type: AN_TRANSACTION_TYPE
			l_answer: AN_RESPONSE
			l_credit_card: AN_CREDIT_CARD
		do
			l_credit_card := (create{CREDIT_CARD_FIXTURE_FACTORY}).default_credit_card

				-- Create a transaction type auth_capture
			create l_transaction_type.make
			l_transaction_type.mark_auth_capture

				-- Create a merchant
			create a_merchant.make_sandbox ("5ZDctVvu5Y99", "265dz3TTu28CmeWD") -- I need to retrieve them from a file

				-- Create a new transaction aim with a merchant an a transaction type
			l_transaction := (create {AN_TRANSACTION_FACTORY}).new_aim_transaction (a_merchant, l_transaction_type, 27.36)
			l_transaction.set_credit_card (l_credit_card)
			l_transaction.set_customer ((create {CUSTOMER_FIXTURE_FACTORY}).customer_1)
			l_transaction.set_order ((create {ORDER_FIXTURE_FACTORY}).order_1)
			create l_executor.make (a_merchant, l_transaction)
			l_answer := l_executor.execute_aim_transaction

			assert ("Transaction Approved:", l_answer.response_code.is_approved)
			assert ("Response Reason Code is RRC_1_1", l_answer.response_reason_codes.code = rrc_1_1.code )
		end

end


