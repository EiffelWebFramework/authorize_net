note
	description: "Summary description for {CUSTOMER_FIXTURE_FACTORY}."
	author: ""
	date: "$Date: 2013-06-10 14:17:31 -0300 (lun 10 de jun de 2013) $"
	revision: "$Revision: 29 $"

class
	CUSTOMER_FIXTURE_FACTORY

feature -- factory

	default_customer: AN_CUSTOMER
		do
			create Result
		end

	customer_1: AN_CUSTOMER
		do
			Result := default_customer
			Result.set_first_name ("John")
			Result.set_last_name ("Doe")
			Result.set_address ("123 Any Street")
			Result.set_city ("Any City")
			Result.set_company ("John Doe Innovations")
			Result.set_state ("CA")
			Result.set_zip_postal_code ("94114")
			Result.set_email ("customer1@merchant.com")
			Result.set_country ("US")
			Result.set_customer_id ("CUST000001")
			Result.set_customer_ip ("127.0.0.1")
			Result.set_phone ("415-555-1212")
			Result.set_fax ("415-555-1313")
		end

	customer_2: AN_CUSTOMER
		do
			Result := default_customer
			Result.set_first_name ("Mike")
			Result.set_last_name ("Kelly")
			Result.set_address ("123 HAL Street")
			Result.set_city ("HAL City")
			Result.set_company ("HAL Innovations")
			Result.set_state ("FL")
			Result.set_zip_postal_code ("12345")
			Result.set_email ("customer2@merchant.com")
			Result.set_country ("US")
			Result.set_customer_id ("CUST000002")
			Result.set_customer_ip ("127.0.0.1")
			Result.set_phone ("415-555-1414")
			Result.set_fax ("415-555-1515")
		end

end
