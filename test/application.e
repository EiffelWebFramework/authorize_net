note
	description: "authorizeNet application root class"
	date: "$Date: 2013-06-11 09:18:33 -0300 (mar 11 de jun de 2013) $"
	revision: "$Revision: 32 $"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
--			test_credit_card_auth_capture
			test_echeck
		end

	test_credit_card_auth_only
		local
			a_merchant: AN_MERCHANT
			l_executor: AN_TRANSACTION_EXECUTOR
			l_transaction: AN_AIM_TRANSACTION
			l_transaction_type: AN_TRANSACTION_TYPE
			l_answer: AN_RESPONSE
			l_credit_card: AN_CREDIT_CARD
		do
				-- Create a new credit card
			create l_credit_card.make ("370000000000002", "052015")

				-- Create a transaction type auth_only
			create l_transaction_type.make
			l_transaction_type.mark_auth_only

				-- Create a merchant
			create a_merchant.make_sandbox ("5ZDctVvu5Y99", "265dz3TTu28CmeWD")

				-- Create a new transaction aim with a merchant an a transaction type
			l_transaction := (create {AN_TRANSACTION_FACTORY}).new_aim_transaction (a_merchant, l_transaction_type, 100)
			l_transaction.set_credit_card (l_credit_card)
			create l_executor.make (a_merchant, l_transaction)
			l_answer := l_executor.execute_aim_transaction
			from
				l_answer.response_fields.start
			until
				l_answer.response_fields.after
			loop
				print (l_answer.response_fields.key_for_iteration)
				print (":")
				print (l_answer.response_fields.item_for_iteration)
				print ("%N")
				l_answer.response_fields.forth
			end
		end

	test_credit_card_auth_capture
		local
			a_merchant: AN_MERCHANT
			l_executor: AN_TRANSACTION_EXECUTOR
			l_transaction: AN_AIM_TRANSACTION
			l_transaction_type: AN_TRANSACTION_TYPE
			l_answer: AN_RESPONSE
			l_credit_card: AN_CREDIT_CARD
		do
			l_credit_card := (create {CREDIT_CARD_FIXTURE_FACTORY}).default_credit_card

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
			l_answer := l_executor.execute_aim_transaction
			from
				l_answer.response_fields.start
			until
				l_answer.response_fields.after
			loop
				print (l_answer.response_fields.key_for_iteration)
				print (":")
				print (l_answer.response_fields.item_for_iteration)
				print ("%N")
				l_answer.response_fields.forth
			end
		end

	test_echeck
		local
			a_merchant: AN_MERCHANT
			l_executor: AN_TRANSACTION_EXECUTOR
			l_transaction: AN_AIM_TRANSACTION
			l_transaction_type: AN_TRANSACTION_TYPE
			l_answer: AN_RESPONSE
			l_check: AN_ECHECK
		do

			l_check := (create {ECHECK_FIXTURE_FACTORY}).echeck_1

				-- Create a transaction type auth_capture
			create l_transaction_type.make
			l_transaction_type.mark_auth_capture

				-- Create a merchant
			create a_merchant.make_sandbox ("5ZDctVvu5Y99", "265dz3TTu28CmeWD") -- I need to retrieve them from a file

				-- Create a new transaction aim with a merchant an a transaction type
			l_transaction := (create {AN_TRANSACTION_FACTORY}).new_aim_transaction (a_merchant, l_transaction_type, 27.36)
			l_transaction.set_echeck (l_check)
			l_transaction.set_customer ((create {CUSTOMER_FIXTURE_FACTORY}).customer_1)
			l_transaction.set_order ((create {ORDER_FIXTURE_FACTORY}).order_1)
			create l_executor.make (a_merchant, l_transaction)
			l_answer := l_executor.execute_aim_transaction
			l_answer := l_executor.execute_aim_transaction
			from
				l_answer.response_fields.start
			until
				l_answer.response_fields.after
			loop
				print (l_answer.response_fields.key_for_iteration)
				print (":")
				print (l_answer.response_fields.item_for_iteration)
				print ("%N")
				l_answer.response_fields.forth
			end
		end


end
