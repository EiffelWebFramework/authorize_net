note
	description: "Objects that represent an Advance Integration Method (AIM)"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=13"

class
	AN_AIM_TRANSACTION

inherit

	AN_TRANSACTION

create
	make

feature -- Access

	request_map: STRING_TABLE [STRING_32]

	response_map: STRING_TABLE [STRING_32]

	merchant_map: STRING_TABLE [STRING_32]

	credit_card: detachable AN_CREDIT_CARD
			--	e_check : AN_ECHECK
			--	customer : AN_CUSTOMER

	email_receipt: detachable AN_EMAIL_RECEIPT

	order: detachable AN_ORDER

	shipping_address: detachable AN_SHIPPING_ADDRESS

	shipping_charges: detachable AN_SHIPPING_CHARGES

	transaction: AN_TRANSACTION_TYPE

	card_present: BOOLEAN

	md5value: detachable STRING_32

feature -- Initialization

	make (a_merchant: AN_MERCHANT; a_transactional_type: AN_TRANSACTION_TYPE; amount: DOUBLE)
		do
			set_encap_char_delimiter ({AN_CONSTANTS}.Encap_char_delimiter)
			set_field_delimiter ({AN_CONSTANTS}.Transaction_field_delimiter)
			create request_map.make (10)
			create merchant_map.make (10)
			create response_map.make (10)
			request_map.force ({AN_CONSTANTS}.version, {AN_CONSTANTS}.x_version)
			request_map.force (field_delimiter, {AN_CONSTANTS}.x_delim_char)
			request_map.force ({AN_CONSTANTS}.s_true, {AN_CONSTANTS}.x_delim_data)
			request_map.force (encap_char_delimiter, {AN_CONSTANTS}.x_encap_char)

				--setup environment
			if a_merchant.environment.test_mode then
				request_map.force ({AN_CONSTANTS}.s_true, {AN_CONSTANTS}.x_test_request)
			else -- test mode
				request_map.force ({AN_CONSTANTS}.s_false, {AN_CONSTANTS}.x_test_request)
			end

				-- setup merchant
			request_map.force (a_merchant.login, {AN_CONSTANTS}.x_login)
			request_map.force (a_merchant.transaction_key, {AN_CONSTANTS}.x_tran_key)
			if a_merchant.allow_partial_auth then
				request_map.force ({AN_CONSTANTS}.s_true, {AN_CONSTANTS}.x_allow_partial_auth)
			else
				request_map.force ({AN_CONSTANTS}.s_true, {AN_CONSTANTS}.x_allow_partial_auth)
			end

				-- set transaction type
			transaction := a_transactional_type
			request_map.force (transaction.transaction_description, {AN_CONSTANTS}.x_type)
			request_map.force (formatted (amount, {AN_CONSTANTS}.currency_decimal_places), {AN_CONSTANTS}.x_amount)

				--SIM applications use relay response. Set this to false (default) if you are using AIM.
			request_map.force ({AN_CONSTANTS}.s_false, {AN_CONSTANTS}.x_relay_response)

				--Indicates whether a delimited transaction response is required
			request_map.force ({AN_CONSTANTS}.s_true, {AN_CONSTANTS}.x_delim_data)
		end

feature -- Set Transaction Information

	set_credit_card (a_credit_card: AN_CREDIT_CARD)
			-- Set the credit card information for the transaction request
		local
			l_payment_method: AN_PAYMENT_METHOD
		do
			create l_payment_method.make
			request_map.force (l_payment_method.credit_card_value, {AN_CONSTANTS}.x_method)
			request_map.force (a_credit_card.credit_card_number, {AN_CONSTANTS}.x_card_num)
			request_map.force (a_credit_card.expiration_date, {AN_CONSTANTS}.x_exp_date)
		end

	set_customer (a_customer: AN_CUSTOMER)
			-- Set customer information for the transaction request
		do
			if attached a_customer.first_name as l_fn then
				request_map.force (l_fn, {AN_CONSTANTS}.x_first_name)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_first_name)
			end
			if attached a_customer.last_name as l_ln then
				request_map.force (l_ln, {AN_CONSTANTS}.x_last_name)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_last_name)
			end
			if attached a_customer.company as l_cp then
				request_map.force (l_cp, {AN_CONSTANTS}.x_company)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_company)
			end
			if attached a_customer.address as l_addr then
				request_map.force (l_addr, {AN_CONSTANTS}.x_address)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_address)
			end
			if attached a_customer.city as l_city then
				request_map.force (l_city, {AN_CONSTANTS}.x_city)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_city)
			end
			if attached a_customer.state as l_state then
				request_map.force (l_state, {AN_CONSTANTS}.x_state)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_state)
			end
			if attached a_customer.zip_postal_code as l_zip then
				request_map.force (l_zip, {AN_CONSTANTS}.x_zip)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_zip)
			end
			if attached a_customer.country as l_country then
				request_map.force (l_country, {AN_CONSTANTS}.x_country)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_country)
			end
			if attached a_customer.phone as l_phone then
				request_map.force (l_phone, {AN_CONSTANTS}.x_phone)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_phone)
			end
			if attached a_customer.fax as l_fax then
				request_map.force (l_fax, {AN_CONSTANTS}.x_fax)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_fax)
			end
			if attached a_customer.email as l_email then
				request_map.force (l_email, {AN_CONSTANTS}.x_email)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_email)
			end
			if attached a_customer.customer_id as l_cust_id then
				request_map.force (l_cust_id, {AN_CONSTANTS}.x_cust_id)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_cust_id)
			end
			if attached a_customer.customer_ip as l_cust_ip then
				request_map.force (l_cust_ip, {AN_CONSTANTS}.x_customer_ip)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_customer_ip)
			end
		end

	set_order (an_order: AN_ORDER)
			-- Set order with `an_order' for the transaction request
		local
			l_items_string: STRING_32
			l_first_item: BOOLEAN
			l_url_utf8: UTF8_URL_ENCODER
		do
			create l_url_utf8
			create l_items_string.make_empty
			order := an_order
			if attached an_order.invoice_number as l_invoice_number then
				request_map.force (l_invoice_number, {AN_CONSTANTS}.x_invoice_num)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_invoice_num)
			end
			if attached an_order.description as l_description then
				request_map.force (l_description, {AN_CONSTANTS}.x_description)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_description)
			end
			if attached an_order.order_items as l_items then
				from
					l_items.start
					l_first_item := True
				until
					l_items.after
				loop
					if l_first_item then
						l_first_item := False
					else
						l_items_string.append ("&")
						l_items_string.append ({AN_CONSTANTS}.x_line_item)
						l_items_string.append ("=")
					end

						-- id
					if attached l_items.item.id as l_id then
						l_items_string.append (l_url_utf8.encoded_string (l_id))
					else
						l_items_string.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
					end
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

						-- name
					if attached l_items.item.name as l_name then
						l_items_string.append (l_url_utf8.encoded_string (l_name))
					else
						l_items_string.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
					end
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

						-- description
					if attached l_items.item.description as l_description then
						l_items_string.append (l_url_utf8.encoded_string (l_description))
					else
						l_items_string.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
					end
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

						-- quantity
					l_items_string.append (l_url_utf8.encoded_string (l_items.item.quantity.out))
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

						-- price
					l_items_string.append (l_url_utf8.encoded_string (formatted (l_items.item.price, {AN_CONSTANTS}.currency_decimal_places)))
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

						-- is item taxable?
					l_items_string.append (l_items.item.taxable.out)
					l_items_string.append ({AN_CONSTANTS}.bracket_pipe_delimiter)
					l_items.forth
				end
				response_map.force (l_items_string, {AN_CONSTANTS}.x_line_item)
			end
			if attached an_order.shipping_charges as l_shipping_charges then
				set_shipping_charges (l_shipping_charges)
			end
		end

	set_authorization_code (a_code: READABLE_STRING_32)
			-- The authorization code of an original transaction not captured on the payment gateway.
		do
			request_map.force (a_code, {AN_CONSTANTS}.x_auth_code)
		end

	set_duplicate_window (seconds: INTEGER)
			-- The window of time after the submission of a transaction that a duplicate transaction can not be submitted.
			-- Default window of 2 minutes
			-- Max value of 8 minutes
		require
			valid_range: seconds >= 0 and then seconds <= 28800
		do
			request_map.force (seconds.out, {AN_CONSTANTS}.x_duplicate_window)
		end

	set_recurring_billing (status: BOOLEAN)
			-- Indicating marker used by merchant account providers to identify transactions which originate from merchant
			-- hosted recurring billing applications. This value is not affiliated with Automated Recurring Billing.
		do
			request_map.force (status.out, {AN_CONSTANTS}.x_recurring_billing)
		end

	set_email_receipt (email: AN_EMAIL_RECEIPT)
			-- Set the EmailReceipt information for the transaction request.
		do
			email_receipt := email
			if attached email.email as l_email then
				request_map.force (l_email, {AN_CONSTANTS}.x_email)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_email)
			end
			if attached email.email_customer as l_email_customer then
				request_map.force (l_email_customer.out, {AN_CONSTANTS}.x_email_customer)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_email_customer)
			end
			if attached email.header as l_header then
				request_map.force (l_header, {AN_CONSTANTS}.x_header_email_receipt)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_header_email_receipt)
			end
			if attached email.footer as l_footer then
				request_map.force (l_footer, {AN_CONSTANTS}.x_footer_email_receipt)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_footer_email_receipt)
			end
			if attached email.merchant_email as l_merchant_email then
				request_map.force (l_merchant_email, {AN_CONSTANTS}.x_merchant_email)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_merchant_email)
			end
		end

	set_shipping_address (a_shipping_address: AN_SHIPPING_ADDRESS)
			-- Set the ShippingAddress for the transaction request.
		do
			shipping_address := a_shipping_address
			if attached a_shipping_address.first_name as l_first_name then
				request_map.force (l_first_name, {AN_CONSTANTS}.x_ship_to_first_name)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_first_name)
			end
			if attached a_shipping_address.last_name as l_last_name then
				request_map.force (l_last_name, {AN_CONSTANTS}.x_ship_to_last_name)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_last_name)
			end
			if attached a_shipping_address.company as l_company then
				request_map.force (l_company, {AN_CONSTANTS}.x_ship_to_company)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_company)
			end
			if attached a_shipping_address.address as l_address then
				request_map.force (l_address, {AN_CONSTANTS}.x_ship_to_address)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_address)
			end
			if attached a_shipping_address.city as l_city then
				request_map.force (l_city, {AN_CONSTANTS}.x_ship_to_city)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_city)
			end
			if attached a_shipping_address.state as l_state then
				request_map.force (l_state, {AN_CONSTANTS}.x_ship_to_state)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_state)
			end
			if attached a_shipping_address.zip_postal_code as l_zip then
				request_map.force (l_zip, {AN_CONSTANTS}.x_ship_to_zip)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_zip)
			end
			if attached a_shipping_address.country as l_country then
				request_map.force (l_country, {AN_CONSTANTS}.x_ship_to_country)
			else
				request_map.force ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_ship_to_country)
			end
		end

	set_shipping_charges (a_shipping_charges: AN_SHIPPING_CHARGES)
			--	Set the ShippingCharges for the transaction request.
			--| UrlEconde, UTF-8
			--| Figure out how to handle DECIMAL PLACES and ROUND_HALD_UP
		local
			l_buffer: STRING_32
			l_url_utf8: UTF8_URL_ENCODER
		do
			create l_url_utf8
			create l_buffer.make_empty
			shipping_charges := a_shipping_charges
				-- tax charges
			if a_shipping_charges.tax_amount > {AN_CONSTANTS}.zero_amount then
					--tax item
				if attached a_shipping_charges.tax_item_name as l_tax_item_name then
					l_buffer.append (l_url_utf8.encoded_string (l_tax_item_name))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					-- tax description
				if attached a_shipping_charges.tax_description as l_tax_description then
					l_buffer.append (l_url_utf8.encoded_string (l_tax_description))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					--Tax amount
				l_buffer.append (l_url_utf8.encoded_string (formatted (a_shipping_charges.tax_amount, {AN_CONSTANTS}.currency_decimal_places)))
				request_map.put (l_buffer, {AN_CONSTANTS}.x_tax)
			end

				--freight charges
			l_buffer.make_empty
			if a_shipping_charges.freight_amount > {AN_CONSTANTS}.zero_amount then
					--freight item
				if attached a_shipping_charges.freight_item_name as l_freight_item_name then
					l_buffer.append (l_url_utf8.encoded_string (l_freight_item_name))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					-- freight description
				if attached a_shipping_charges.freight_description as l_freight_description then
					l_buffer.append (l_url_utf8.encoded_string (l_freight_description))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					--freight amount
				l_buffer.append (l_url_utf8.encoded_string (formatted (a_shipping_charges.freight_amount, {AN_CONSTANTS}.currency_decimal_places)))
				request_map.put (l_buffer, {AN_CONSTANTS}.x_freight)
			end

				--duty charges
			l_buffer.make_empty
			if a_shipping_charges.duty_amount > {AN_CONSTANTS}.zero_amount then
					--duty item
				if attached a_shipping_charges.duty_item_name as l_duty_item_name then
					l_buffer.append (l_url_utf8.encoded_string (l_duty_item_name))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					-- duty description
				if attached a_shipping_charges.duty_item_description as duty_item_description then
					l_buffer.append (l_url_utf8.encoded_string (duty_item_description))
				else
					l_buffer.append (l_url_utf8.encoded_string ({AN_CONSTANTS}.empty_string))
				end
				l_buffer.append ({AN_CONSTANTS}.bracket_pipe_delimiter)

					--duty amount
				l_buffer.append (l_url_utf8.encoded_string (formatted (a_shipping_charges.duty_amount, {AN_CONSTANTS}.currency_decimal_places)))
				request_map.put (l_buffer, {AN_CONSTANTS}.x_duty)
			end
			request_map.put (a_shipping_charges.tax_exempt.out, {AN_CONSTANTS}.x_tax_exempt)
			if attached a_shipping_charges.purchase_order_number as l_po then
				request_map.put (l_po, {AN_CONSTANTS}.x_po_num)
			else
				request_map.put ({AN_CONSTANTS}.empty_string, {AN_CONSTANTS}.x_po_num)
			end
		end

	set_echeck (an_echeck: AN_ECHECK)
			-- Set echeck information `an_echeck'  for the transaction request
		local
			l_payment_method: AN_PAYMENT_METHOD
		do
			create l_payment_method.make
			l_payment_method.mark_e_check
			request_map.force (l_payment_method.method_value, {AN_CONSTANTS}.x_method)
			if attached an_echeck.routing_number as l_routing_number then
				request_map.force (l_routing_number, {AN_CONSTANTS}.x_bank_aba_code)
			end
			if attached an_echeck.bank_account_number as l_bank_account_number then
				request_map.force (l_bank_account_number, {AN_CONSTANTS}.x_bank_acct_num)
			end
			if attached an_echeck.bank_account_type as l_bank_account_type then
				request_map.force (l_bank_account_type.description, {AN_CONSTANTS}.x_bank_acct_type)
			end
			if attached an_echeck.bank_name as l_bank_name then
				request_map.force (l_bank_name, {AN_CONSTANTS}.x_bank_name)
			end
			if attached an_echeck.bank_account_name as l_bank_account_name then
				request_map.force (l_bank_account_name, {AN_CONSTANTS}.x_bank_acct_name)
			end
			if attached an_echeck.echeck_type as l_echeck_type then
				request_map.force (l_echeck_type.echeck_value, {AN_CONSTANTS}.x_echeck_type)
			end
			if attached an_echeck.echeck_type as l_echeck_type and then (l_echeck_type.is_arc or l_echeck_type.is_boc) then
				if attached an_echeck.bank_check_number as l_bank_check_number then
					request_map.force (l_bank_check_number, {AN_CONSTANTS}.x_bank_check_number)
				end
			end
		end

feature -- Process

	build_request_mapping_as_nvp: STRING_32
			-- Prepare the name/value pair mapping.
			--|TODO add support for line items
		local
			l_url_utf8: UTF8_URL_ENCODER
			l_value, l_key: STRING_32
		do
			create Result.make_empty
			create l_url_utf8
			from
				request_map.start
			until
				request_map.after
			loop
				l_key := request_map.key_for_iteration.as_string_32
				l_value := request_map.item_for_iteration.as_string_32
				if not l_key.same_string ({AN_CONSTANTS}.x_line_item) and then not l_key.same_string ({AN_CONSTANTS}.x_tax)
					and then not l_key.same_string ({AN_CONSTANTS}.x_freight) and then not l_key.same_string ({AN_CONSTANTS}.x_duty) then
					l_value := l_url_utf8.encoded_string (l_value)
				end
				Result.append (l_url_utf8.encoded_string (l_key))
				Result.append ("=")
				Result.append (request_map.item_for_iteration.as_string_32)
				request_map.forth
				if not request_map.after then
					Result.append ("&")
				end
			end
		end

feature {NONE} -- Implementation

	formatted (v: REAL_64; p: INTEGER): STRING_32
			-- Format the value 'v' as a string in a string with a precision of
			-- to `p' places to the right of the decimal point.
		local
			fmt: FORMAT_DOUBLE
		do
			create fmt.make (v.floor_real_64.out.count, p)
			Result := fmt.formatted (v)
		end

end
