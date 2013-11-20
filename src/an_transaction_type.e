note
	description: "Objects that describe a transaction type supported by a Payment Gateway"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=16"

class
	AN_TRANSACTION_TYPE

create
	make
feature {NONE}-- Initialization
	make
		do
			mark_auth_capture
		end

feature -- Access

	transaction_type: INTEGER

	transaction_description: READABLE_STRING_32

feature -- Set Transaction Type

	set_transaction_type (a_transaction_type: like transaction_type)
			-- Set transaction_type with `a_transaction_type'.
		require
			valid_transaction_type: is_valid_type (a_transaction_type)
		do
			transaction_type := a_transaction_type
			inspect a_transaction_type
				when auth_capture then
					transaction_description := auth_capture_description
				when auth_only then
					transaction_description := auth_only_description
				when prior_auth_capture then
					transaction_description := prior_auth_capture_description
				when capture_only  then
					transaction_description := capture_only_description
				when credit then
					transaction_description := credit_description
				else
					transaction_description := x_void_description
				end
		ensure
			transaction_type_set: transaction_type = a_transaction_type
		end

	mark_auth_capture
		do
			set_transaction_type (auth_capture)
		ensure
			transaction_description_set : transaction_description.same_string(auth_capture_description)
		end

	mark_auth_only
		do
			set_transaction_type (auth_only)
		ensure
			transaction_description_set : transaction_description.same_string( auth_only_description )
		end

	mark_prior_auth_capture
		do
			set_transaction_type (prior_auth_capture)
		ensure
			transaction_description_set : transaction_description.same_string( prior_auth_capture_description)
		end

	mark_capture_only
		do
			set_transaction_type (capture_only)
		ensure
			transaction_description_set : transaction_description.same_string(capture_only_description)
		end

	mark_credit
		do
			set_transaction_type (credit)
		ensure
			transaction_description_set : transaction_description.same_string( credit_description )
		end

	mark_void
		do
			set_transaction_type (x_void)
		ensure
			transaction_description_set : transaction_description.same_string (x_void_description)
		end


feature -- Status Reports

	is_valid_type (s: INTEGER_32): BOOLEAN
			-- Is `s' a valid transaction type?
		do
			inspect s
			when auth_capture, auth_only, prior_auth_capture, capture_only, credit, x_void then
				Result := True
			else
			end
		end

	is_auth_capture : BOOLEAN
		do
			Result := transaction_type = auth_capture
		end

	is_auth_only : BOOLEAN
		do
			Result := transaction_type = auth_only
		end

	is_prior_auth_capture : BOOLEAN
		do
			Result := transaction_type = prior_auth_capture
		end

	is_capture_only	 : BOOLEAN
		do
			Result := transaction_type = capture_only
		end

	is_credit : BOOLEAN
		do
			Result := transaction_type = credit
		end

	is_void : BOOLEAN
		do
			Result := transaction_type = x_void
		end

feature -- Constants

	Auth_capture: INTEGER = 1

	Auth_capture_description: STRING = "AUTH_CAPTURE"
			--Authorization and Capture
			--This is the most common type of credit card transaction and is the default payment
			--gateway transaction type. The amount is sent for authorization, and if approved, is
			--automatically submitted for settlement.

	Auth_only: INTEGER = 2

	Auth_only_description: STRING = "AUTH_ONLY"
			--Authorization Only
			--This transaction type is sent for authorization only. The transaction will not be sent for
			--settlement until the credit card transaction type Prior Authorization and Capture (see
			--definition below) is submitted, or the transaction is submitted for capture manually in the
			--Merchant Interface. For more information about capturing Authorization Only transactions
			--in the Merchant Interface, see the Merchant Integration Guide at http://www.authorize.net/
			--support/merchant/.
			--If action for the Authorization Only transaction is not taken on the payment gateway within
			--30 days, the authorization expires and is no longer available for capture. A new
			--Authorization Only transaction would then have to be submitted to obtain a new
			--authorization code.
			--Merchants can submit Authorization Only transactions if they want to verify the availability
			--of funds on the customer’s credit card before finalizing the transaction. This transaction
			--type can also be submitted if the merchant does not currently have an item in stock or
			--wants to review orders before shipping goods.

	Prior_auth_capture: INTEGER = 3

	Prior_auth_capture_description: STRING = "PRIOR_AUTH_CAPTURE"
			--Prior Authorization and Capture
			--This transaction type is used to complete an Authorization Only transaction that was
			--successfully authorized through the payment gateway.
			--The unique field requirements for a Prior Authorization and Capture are:
			--x_type=PRIOR_AUTH_CAPTURE
			--x_trans_id=Transaction ID here
			--For this transaction type, the amount field (x_amount) is required only if a Prior
			--Authorization and Capture is submitted for an amount that is less than the amount of the
			--original Authorization Only transaction. If no amount is submitted, the payment gateway
			--will initiate settlement for the amount of the original authorized transaction.

	Capture_only: INTEGER = 4

	Capture_only_description: STRING = "CAPTURE_ONLY"
			--Capture Only
			--This transaction type is used to complete a previously authorized transaction that was not
			--originally submitted through the payment gateway or that requires voice authorization.
			--The payment gateway accepts this transaction type and initiates settlement if the following
			--conditions are met:
			--	 The transaction is submitted with the valid authorization code issued to the merchant
			--to complete the transaction.
			--The unique field requirements for a Capture Only transaction are:
			--x_type=CAPTURE_ONLY
			--x_auth_code=Authorization Code here
			--For instructions on how to perform a Capture Only transaction in the Merchant Interface,
			--see the Merchant Integration Guide at http://www.authorize.net/support/merchant/.

	Credit: INTEGER = 5

	Credit_description: STRING = "CREDIT"
			--Credit (Refund)
			--This transaction type is used to refund a customer for a transaction that was originally
			--processed and successfully settled through the payment gateway.
			--The payment gateway accepts Credits if the following conditions are met:
			--	The transaction is submitted with the valid transaction ID (x_trans_id) of an original,
			--	successfully settled transaction.
			--	The amount being requested for refund is less than or equal to the original settled
			--	amount.
			--	The sum of multiple Credit transactions submitted against the original transaction is
			--	less than or equal to the original settled amount.
			--	At least the last four digits of the credit card number (x_card_num) used for the
			--	original, successfully settled transaction are submitted. An expiration date is not
			--	required.
			--	The transaction is submitted within 120 days of the settlement date of the original
			--	transaction.
			--The unique field requirements for a Credit transaction are:
			--x_type=CREDIT
			--x_trans_id=Transaction ID here
			--x_card_num=Full credit card number or last four digits only here

	X_void: INTEGER = 6

	X_void_description: STRING = "VOID"
			--	Void
			--This transaction type can be used to cancel either an original transaction that is not yet
			--settled, or an entire order composed of more than one transactions. A Void prevents the
			--transaction or the order from being sent for settlement. A Void can be submitted against
			--any other transaction type.

invariant
	transaction_type_set: is_valid_type (transaction_type)
end
