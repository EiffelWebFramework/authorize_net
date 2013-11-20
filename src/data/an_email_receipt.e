note
	description: "Objects that represent an {AN_EMAIL_RECEIPT} email receipt."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=62"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=37"

class
	AN_EMAIL_RECEIPT

feature -- Access

	merchant_email: detachable STRING_32
			-- Any valid email address

	footer: detachable STRING_32
			-- The email receipt footer

	header: detachable STRING_32
			-- The email receipt header

	email_customer: BOOLEAN
			-- The customer email receipt status

	email: detachable STRING_32
			--  The customer's valid email address

feature -- Element change

	set_merchant_email (a_merchant_email: READABLE_STRING_32)
			-- Assign `merchant_email' with `a_merchant_email'.
		require
			upto255characters: a_merchant_email.count <= 255
		do
			merchant_email := a_merchant_email
		ensure
			merchant_email_assigned: merchant_email = a_merchant_email
		end

	set_footer (a_footer: like footer)
			-- Assign `footer' with `a_footer'.
			-- This text will appear as the footer on the email receipt sent to the customer.
		do
			footer := a_footer
		ensure
			footer_assigned: footer = a_footer
		end

	set_header (a_header: like header)
			-- Assign `header' with `a_header'.
			-- This text will appear as the header of the email receipt sent to the customer.
		do
			header := a_header
		ensure
			header_assigned: header = a_header
		end

	set_email_customer (an_email_customer: like email_customer)
			-- Assign `email_customer' with `an_email_customer'.
			--Indicates whether an email receipt should be sent to the customer.
			-- If set to TRUE, the payment gateway will send an email to the customer after the
			-- transaction is processed using the customer email address submitted with the
			-- transaction. If FALSE, no email is sent to the customer.
			-- If no value is submitted, the payment gateway will look up the configuration in the
			-- Merchant Interface and send an email only if the merchant has enabled the setting. If this
			-- field is not submitted and the setting is disabled in the Merchant Interface, no email is sent.
		do
			email_customer := an_email_customer
		ensure
			email_customer_assigned: email_customer = an_email_customer
		end

	set_email (an_email: READABLE_STRING_32)
			-- Assign `email' with `an_email'.
			-- The email address to which the customer's copy of the email receipt is sent when
			-- Email Receipts is configured in the Merchant Interface. The email is sent to the customer
			-- only if the email address format is valid.
		require
			upto255characters: an_email.count <= 255
		do
			email := an_email
		ensure
			email_assigned: email = an_email
		end

end
