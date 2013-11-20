note
	description: "Objects that describe an {AN_ADDRESS}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"

class
	AN_ADDRESS

feature -- Access

	first_name: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The first name associated with the customer's billing address
			--Format: Up to 50 characters (no symbols)

	last_name: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The last name associated with the customer's billing address
			--Format: Up to 50 characters (no symbols)

	company: detachable STRING_32
			--	ptional
			--Value: The company associated with the customer's billing address
			--Format: Up to 50 characters (no symbols)

	address: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The customer's billing address
			--Format: Up to 60 characters (no symbols)
			--Required if the merchant would like to use the Address Verification Service
			--security feature.

	city: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The city of the customer's billing address
			--Format: Up to 40 characters (no symbols)

	state: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The state of the customer's billing address
			--Format: Up to 40 characters (no symbols) or a valid two-character state
			--code

	zip_postal_code: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The ZIP code of the customer's billing address
			--Format: Up to 20 characters (no symbols)
			--Required if the merchant would like to use the Address Verification Service
			--security feature.

	country: detachable STRING_32
			--Required only when using a European Payment Processor.
			--Value: The country of the customer's billing address
			--Format: Up to 60 characters (no symbols)

feature -- Change Element

	set_first_name (fname : READABLE_STRING_32)
			-- Set `first_name' to `fname'
		require
			upto50characters : fname.count <= 50
		do
			first_name := fname
		ensure
			first_name_set : first_name = fname
		end

	set_last_name (lname : READABLE_STRING_32)
			-- Set `last_name' to `lname'
		require
			upto50characters : lname.count <= 50
		do
			last_name := lname
		ensure
			last_name_set : last_name = lname
		end


	set_company (a_company : READABLE_STRING_32)
			-- Set `company' to `a_company'
		require
			upto50characters : a_company.count <= 50
		do
			company := a_company
		ensure
			company_set : company = a_company
		end



	set_address (an_address : READABLE_STRING_32)
			-- Set `address' to `an_address'
		require
			upto60characters : an_address.count <= 60
		do
			address := an_address
		ensure
			address_set : address = an_address
		end


	set_city (a_city : READABLE_STRING_32)
			-- Set `city' to `a_city'
		require
			upto40characters : a_city.count <= 40
		do
			city := a_city
		ensure
			city_set : city = a_city
		end


	set_state (a_state : READABLE_STRING_32)
			-- Set `state' to `a_state'
		require
			upto40characters : a_state.count <= 40
		do
			state := a_state
		ensure
			state_set : state = a_state
		end


	set_zip_postal_code (a_zip_postal_code : READABLE_STRING_32)
			-- Set `zip_postal_code' to `a_zip_postal_code'
		require
			upto20characters : a_zip_postal_code.count <= 20
		do
			zip_postal_code := a_zip_postal_code
		ensure
			zip_postal_code_set : zip_postal_code = a_zip_postal_code
		end


	set_country (a_country : READABLE_STRING_32)
			-- Set `country' to `a_country'
		require
			upto60characters : a_country.count <= 60
		do
			country := a_country
		ensure
			country_set : country = a_country
		end

end
