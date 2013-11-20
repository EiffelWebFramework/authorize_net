note
	description: "Object's that represent customer information"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=30"
class
	AN_CUSTOMER

inherit

	AN_ADDRESS

feature -- Access

	phone: detachable STRING_32
			--Optional
			--Value: The phone number associated with the customer's billing address
			--Format: Up to 25 digits (no letters). For example, (123)123-1234

	fax: detachable STRING_32
			--Optional
			--Value: The fax number associated with the customer's billing address
			--Format: Up to 25 digits (no letters). For example, (123)123-1234

	email: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The customer's valid email address
			--Format: Up to 255 characters. For example, janedoe@customer.com
			--Notes: The email address to which the customer's copy of the email receipt
			--is sent when Email Receipts is configured in the Merchant Interface. The
			--email is sent to the customer only if the email address format is valid.
			--For more information about Email Receipts, see the Merchant Integration

	customer_id: detachable STRING_32
			--Optional
			--Value: The merchant assigned customer ID
			--Format: Up to 20 characters (no symbols)
			--Notes: The unique identifier to represent the customer associated with the
			--transaction.
			--The customer ID must be created dynamically on the merchant server or
			--provided on a per-transaction basis. The payment gateway does not perform
			--this function.

	customer_ip: detachable STRING_32
			--Optional
			--Value: The customer's IP address
			--Format: Up to 15 characters (no letters). For example, 255.255.255.255
			--Notes: IP address of the customer initiating the transaction. If this value is
			--not passed, it will default to 255.255.255.255.
			--This field is required when using customer-IP based Advanced Fraud
			--Detection Suite (AFDS) filters.

feature -- Change Element

	set_phone (a_phone: READABLE_STRING_32)
			-- Set `phone' to `a_phone'
		require
			upto25characters: a_phone.count <= 25
		do
			phone := a_phone
		ensure
			phone_set: phone = a_phone
		end

	set_fax (a_fax: READABLE_STRING_32)
			-- Set `fax' to `a_fax'
		require
			upto25characters: a_fax.count <= 25
		do
			fax := a_fax
		ensure
			fax_set: fax = a_fax
		end

	set_email (an_email: READABLE_STRING_32)
			-- Set `email' to `an_email'
		require
			upto255characters: an_email.count <= 255
		do
			email := an_email
		ensure
			email_set: email = an_email
		end

	set_customer_id (a_customer_id: READABLE_STRING_32)
			-- Set `customer_id' to `a_customer_id'
		require
			upto20characters: a_customer_id.count <= 20
		do
			customer_id := a_customer_id
		ensure
			customer_id_set: customer_id = a_customer_id
		end

	set_customer_ip (a_customer_ip: READABLE_STRING_32)
			-- Set `customer_ip' to `a_customer_ip'
		require
			upto15characters: a_customer_ip.count <= 15
		do
			customer_ip := a_customer_ip
		ensure
			customer_ip_set: customer_ip = a_customer_ip
		end

end
