note
	description: "Authorize.Net Constants"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=41"
	EIS: "name=Unnamed", "protocol=URI", "src=http://www.yourwebsite.com"

class
	AN_CONSTANTS

feature -- Transaction Delimiters

	Max_auth_code_length: INTEGER = 6

	Version: STRING_32 = "3.1"

	Transaction_field_delimiter: STRING_32 = "|"

	Encap_char_delimiter: STRING_32 = ""

	Bracket_pipe_delimiter: STRING_32 = "<|>"

	S_true: STRING_32 = "TRUE"

	S_false: STRING_32 = "FALSE"

	Zero_string: STRING_32 = "0.00"

	Zero_amount: DOUBLE = 0.00

	Empty_string: STRING_32 = ""

	Currency_decimal_places: INTEGER = 2

	Quantity_decimal_places: INTEGER = 4

feature -- Response Fields

	x_response_fields: ARRAY [detachable STRING_32]
		do
			Result := <<x_response_code, Void, x_response_reason_code, x_response_reason_text, x_auth_code, x_avs_code, x_trans_id, x_invoice_num, x_description, x_amount, x_method, x_type, x_cust_id, x_first_name, x_last_name, x_company, x_address, x_city, x_state, x_zip, x_country, x_phone, x_fax, x_email, x_ship_to_first_name, x_ship_to_last_name, x_ship_to_company, x_ship_to_address, x_ship_to_city, x_ship_to_state, x_ship_to_zip, x_ship_to_country, x_tax, x_duty, x_freight, x_tax_exempt, x_po_num, x_md5_hash, x_card_code, x_cavv_response, x_cardholder_authentication_value, Void, Void, Void, Void, Void, Void, Void, Void, Void, Void, x_account_number, x_card_type, x_split_tender_id, x_prepaid_requested_amount, x_prepaid_balance_on_card, Void, Void, Void, Void, Void, Void, Void, Void, Void, Void, Void, Void, Void>>
		end

	Response_fields: HASH_TABLE [READABLE_STRING_GENERAL, INTEGER]
		note
			EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=41"
		once
			create Result.make (68)
			Result.force ("RESPONSE_CODE", 1)
			Result.force ("RESPONSE_SUBCODE", 2)
			Result.force ("RESPONSE_REASON_CODE", 3)
			Result.force ("RESPONSE_REASON_TEXT", 4)
			Result.force ("AUTHORIZATION_CODE", 5)
			Result.force ("AVS_CODE", 6)
			Result.force ("TRANSACTION_ID", 7)
			Result.force ("INVOICE_NUMBER", 8)
			Result.force ("DESCRIPTION", 9)
			Result.force ("AMOUNT", 10)
			Result.force ("METHOD", 11)
			Result.force ("TRANSACTION_TYPE", 12)
			Result.force ("CUSTOMER_ID", 13)
			Result.force ("FIRST_NAME", 14)
			Result.force ("LAST_NAME", 15)
			Result.force ("COMPANY", 16)
			Result.force ("ADDRESS", 17)
			Result.force ("CITY", 18)
			Result.force ("STATE", 19)
			Result.force ("ZIP_CODE", 20)
			Result.force ("COUNTRY", 21)
			Result.force ("PHONE", 22)
			Result.force ("FAX", 23)
			Result.force ("EMAIL_ADDRESS", 24)
			Result.force ("SHIP_TO_FIRST_NAME", 25)
			Result.force ("SHIP_TO_LAST_NAME", 26)
			Result.force ("SHIP_TO_COMPANY", 27)
			Result.force ("SHIP_TO_ADDRESS", 28)
			Result.force ("SHIP_TO_CITY", 29)
			Result.force ("SHIP_TO_STATE", 30)
			Result.force ("SHIP_TO_ZIP_CODE", 31)
			Result.force ("SHIP_TO_COUNTRY", 32)
			Result.force ("TAX", 33)
			Result.force ("DUTY", 34)
			Result.force ("FREIGHT", 35)
			Result.force ("TAX_EXEMPT", 36)
			Result.force ("PURCHASE_ORDER_NUMBER", 37)
			Result.force ("MD5_HASH", 38)
			Result.force ("CARD_CODE_RESPONSE", 39)
			Result.force ("CARDHOLDER_AUTHENTICATION_VERIFICATION_RESPONSE", 40)
			Result.force ("RESERVED_1", 41)
			Result.force ("RESERVED_2", 42)
			Result.force ("RESERVED_3", 43)
			Result.force ("RESERVED_4", 44)
			Result.force ("RESERVED_5", 45)
			Result.force ("RESERVED_6", 46)
			Result.force ("RESERVED_7", 47)
			Result.force ("RESERVED_8", 48)
			Result.force ("RESERVED_9", 49)
			Result.force ("RESERVED_10", 50)
			Result.force ("ACCOUNT_NUMBER", 51)
			Result.force ("CARD_TYPE", 52)
			Result.force ("SPLIT_TENDER_ID", 53)
			Result.force ("PREPAID_REQUESTED_AMOUNT", 54)
			Result.force ("PREPAID_BALANCE_ON_CARD", 55)
			Result.force ("RESERVED_11", 56)
			Result.force ("RESERVED_12", 57)
			Result.force ("RESERVED_13", 58)
			Result.force ("RESERVED_14", 59)
			Result.force ("RESERVED_15", 60)
			Result.force ("RESERVED_16", 61)
			Result.force ("RESERVED_17", 62)
			Result.force ("RESERVED_18", 63)
			Result.force ("RESERVED_19", 64)
			Result.force ("RESERVED_20", 65)
			Result.force ("RESERVED_21", 66)
			Result.force ("RESERVED_22", 67)
			Result.force ("RESERVED_23", 68)
		end

feature -- Access

	X_login: STRING = "x_login"
			-- The merchant's unique API Login ID

	X_tran_key: STRING = "x_tran_key"
			-- The merchant's unique Transaction Key

	X_type: STRING = "x_type"
			-- The type of credit card transaction

	X_amount: STRING = "x_amount"
			-- The amount of the transaction

	X_card_num: STRING = "x_card_num"
			-- The customer's credit card number
			--Format; Between 13 and 16 digits without spaces. When x_type=CREDIT,
			--only the last four digits are required.

		--Notes: This is sensitive cardholder information and must be stored
		--securely and in accordance with the Payment Card Industry (PCI) Data
		--Security Standard.
		--For more information about PCI, see the Developer Security Best
		--Practices White Paper.

	X_exp_date: STRING = "x_exp_date"
			--The customer's credit card expiration date.

		--Format; MMYY, MM/YY,MM-YY, MMYYYY, MM/YYYY, MM-YYYY
		--Notes: This is sensitive cardholder information and must be stored
		--securely and in accordance with the Payment Card Industry (PCI) Data
		--Security Standard.
		--For more information about PCI, see the Developer Security Best
		--Practices White Paper.

	X_trans_id: STRING = "x_trans_id"
			--The payment gateway-assigned transaction ID of an original
			--transaction
			--Notes: Required only for CREDIT, PRIOR_AUTH_CAPTURE, and VOID
			--transactions. Do not include this field if you are providing the x_split_
			--tender_id field.
			--For more information about transaction types, see "Credit Card
			--Transaction Types," page 16.

	X_split_tender_id: STRING = "x_split_tender_id"
			--x_split_tender_id Value: The payment gateway-assigned ID that links the current
			--authorization request to the original authorization request.
			--Format; Numeric
			--Notes: This value applies only to partial authorization transactions, and is
			--returned in the reply message from the original authorization request.
			--For more information, see "Partial Authorization Transactions," page 20.

	X_auth_code: STRING = "x_auth_code"
			--x_auth_code Value: The authorization code of an original transaction not authorized on
			--the payment gateway
			--Format; 6 characters
			--Notes: Required only for CAPTURE_ONLY transactions. See "Credit
			--Card Transaction Types," page 16".

	X_relay_response: STRING = "x_relay_response"
			--Value: FALSE
			--Format; FALSE, F, NO, N
			--Notes: SIM applications use relay response. Set this to false if you are
			--using AIM.

	X_delim_data: STRING = "x_delim_data"
			-- Value: Indicates whether a delimited transaction response is required
			--Format; TRUE, T, YES, Y
			--Notes: A value of TRUE indicates a request for delimited response from
			--the payment gateway. Since all AIM transactions are direct response, a
			--value of TRUE is required.
			--Submit this field for each transaction to be sure that transaction responses
			--are returned in the correct format.
			--See Chapter 4, "Transaction Response," on page 39 for more about
			--delimited response.

	X_account_number: STRING_32 = "x_account_number"

	X_address: STRING_32 = "x_address"

	X_allow_partial_Auth: STRING_32 = "x_allow_partial_Auth"

	X_authentication_indicator: STRING_32 = "x_authentication_indicator"

	X_avs_code: STRING_32 = "x_avs_code"

	X_background_url: STRING_32 = "x_background_url"

	X_bank_aba_code: STRING_32 = "x_bank_aba_code"

	X_bank_acct_name: STRING_32 = "x_bank_acct_name"

	X_bank_acct_num: STRING_32 = "x_bank_acct_num"

	X_bank_acct_type: STRING_32 = "x_bank_acct_type"

	X_bank_check_number: STRING_32 = "x_bank_check_number"

	X_bank_name: STRING_32 = "x_bank_name"

	X_card_code: STRING_32 = "x_card_code"

	X_card_type: STRING_32 = "x_card_type"

	X_cardholder_authentication_value: STRING_32 = "x_cardholder_authentication_value"

	X_cavv_response: STRING_32 = "x_cavv_response"

	X_city: STRING_32 = "x_city"

	X_color_background: STRING_32 = "x_color_background"

	X_color_link: STRING_32 = "x_color_link"

	X_color_text: STRING_32 = "x_color_text"

	X_company: STRING_32 = "x_company"

	X_country: STRING_32 = "x_country"

	X_cpversion: STRING_32 = "x_cpversion"

	X_currency_code: STRING_32 = "x_currency_code"

	X_cust_id: STRING_32 = "x_cust_id"

	X_customer_ip: STRING_32 = "x_customer_ip"

	X_cvv2_resp_code: STRING_32 = "x_cvv2_resp_code"

	X_delim_char: STRING_32 = "x_delim_char"

	X_description: STRING_32 = "x_description"

	X_device_type: STRING_32 = "x_device_type"

	X_duplicate_window: STRING_32 = "x_duplicate_window"

	X_duty: STRING_32 = "x_duty"

	X_echeck_type: STRING_32 = "x_echeck_type"

	X_email: STRING_32 = "x_email"

	X_email_customer: STRING_32 = "x_email_customer"

	X_encap_char: STRING_32 = "x_encap_char"

	X_fax: STRING_32 = "x_fax"

	X_first_name: STRING_32 = "x_first_name"

	X_footer_email_receipt: STRING_32 = "x_footer_email_receipt"

	X_footer_html_payment_form: STRING_32 = "x_footer_html_payment_form"

	X_fp_hash: STRING_32 = "x_fp_hash"

	X_fp_sequence: STRING_32 = "x_fp_sequence"

	X_fp_timestamp: STRING_32 = "x_fp_timestamp"

	X_freight: STRING_32 = "x_freight"

	X_header_email_receipt: STRING_32 = "x_header_email_receipt"

	X_header_html_payment_form: STRING_32 = "x_header_html_payment_form"

	X_invoice_num: STRING_32 = "x_invoice_num"

	X_last_name: STRING_32 = "x_last_name"

	X_line_item: STRING_32 = "x_line_item"

	X_logo_url: STRING_32 = "x_logo_url"

	X_market_type: STRING_32 = "x_market_type"

	X_MD5_Hash: STRING_32 = "x_MD5_Hash"

	X_merchant_email: STRING_32 = "x_merchant_email"

	X_method: STRING_32 = "x_method"

	X_phone: STRING_32 = "x_phone"

	X_po_num: STRING_32 = "x_po_num"

	X_prepaid_balance_on_card: STRING_32 = "x_prepaid_balance_on_card"

	X_prepaid_requested_amount: STRING_32 = "x_prepaid_requested_amount"

	X_receipt_link_method: STRING_32 = "x_receipt_link_method"

	X_receipt_link_text: STRING_32 = "x_receipt_link_text"

	X_receipt_link_url: STRING_32 = "x_receipt_link_url"

	X_recurring_billing: STRING_32 = "x_recurring_billing"

	X_relay_url: STRING_32 = "x_relay_url"

	X_rename: STRING_32 = "x_rename"

	X_response_code: STRING_32 = "x_response_code"

	X_response_format: STRING_32 = " x_response_format"

	X_response_reason_code: STRING_32 = "x_response_reason_code"

	X_response_reason_text: STRING_32 = "x_response_reason_text"

	X_ship_to_address: STRING_32 = " x_ship_to_address"

	X_ship_to_city: STRING_32 = "x_ship_to_city"

	X_ship_to_company: STRING_32 = " x_ship_to_company"

	X_ship_to_country: STRING_32 = " x_ship_to_country"

	X_ship_to_first_name: STRING_32 = "x_ship_to_first_name"

	X_ship_to_last_name: STRING_32 = "x_ship_to_last_name"

	X_ship_to_state: STRING_32 = "x_ship_to_state"

	X_ship_to_zip: STRING_32 = "x_ship_to_zip"

	X_show_form: STRING_32 = "x_show_form"

	X_state: STRING_32 = "x_state"

	X_tax: STRING_32 = "x_tax"

	X_tax_exempt: STRING_32 = "x_tax_exempt"

	X_test_request: STRING_32 = "x_test_request"

	X_track1: STRING_32 = "x_track1"

	X_track2: STRING_32 = "x_track2"

	X_user_ref: STRING_32 = "x_user_ref"

	X_version: STRING_32 = "x_version"

	X_zip: STRING_32 = "x_zip"

end
