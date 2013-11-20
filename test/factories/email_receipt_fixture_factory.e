note
	description: "Summary description for {EMAIL_RECEIPT_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-10 14:17:31 -0300 (lun 10 de jun de 2013) $"
	revision: "$Revision: 29 $"

class
	EMAIL_RECEIPT_FIXTURE_FACTORY

feature -- Factories

	default_email: AN_EMAIL_RECEIPT
		do
			create Result
		end

	email_1: AN_EMAIL_RECEIPT
		do
			Result := default_email
			Result.set_header ("Thank you for purchasing  Widgets from The Antibes Company")
			Result.set_header ("If you have any problems  please contact us at +44 20 5555 1212")
			Result.set_merchant_email ("merchant@merchant.com")
		end

end
