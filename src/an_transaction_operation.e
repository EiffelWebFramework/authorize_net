note
	description: "Objects that describe a particular operation supported by the Payment Gateway"
	author: ""
	date: "$Date: 2013-08-06 16:08:41 -0300 (mar, 06 ago 2013) $"
	revision: "$Revision: 192 $"

class
	AN_TRANSACTION_OPERATION

inherit

	HTTP_CLIENT_HELPER

create
	make

feature {NONE} --

	make (a_url: like base_url)
		do
			set_base_url (a_url)
		end

feature -- Operation

	post_aim_transaction (a_transaction: AN_TRANSACTION): AN_RESPONSE
			-- Submit an AIM transaction
			-- Return a transaction response from the payment gateway
		local
			l_response: AN_RESPONSE_CODE
			l_http_response: detachable HTTP_CLIENT_RESPONSE
			l_response_string: STRING_32
			l_response_map: STRING_TABLE [READABLE_STRING_GENERAL]
			l_url_utf8: UTF8_URL_ENCODER
		do
			create l_url_utf8
			create l_response.make
			l_http_response := execute_post ("", a_transaction.build_request_mapping_as_nvp)
			create l_response_string.make_empty
			if attached l_http_response as ll_response and then ll_response.status = 200 and then attached ll_response.body as ll_body then
				l_response_string := ll_body
			else
				l_response_string.append ("3")
				l_response_string.append (a_transaction.field_delimiter)
				l_response_string.append ("3")
				l_response_string.append (a_transaction.field_delimiter)
				l_response_string.append ("22")
				l_response_string.append (a_transaction.field_delimiter)
				if attached l_http_response as ll_response and then attached ll_response.status_line as l_line then
					l_response_string.append (l_line)
				else
					l_response_string.append (" ")
				end
			end
			l_response_string := l_url_utf8.decoded_string (l_response_string)
			l_response_map := create_response_map (l_response_string.split (a_transaction.field_delimiter.at (1)))
			create Result.make (a_transaction, l_response_map)
		end

feature {NONE} -- Implementation

	create_response_map (a_list: LIST [READABLE_STRING_GENERAL]): STRING_TABLE [READABLE_STRING_GENERAL]
			-- Create a new response map.
		local
			l_constants: AN_CONSTANTS
		do
			create l_constants
			create Result.make (3)
			from
				a_list.start
			until
				a_list.after
			loop
				if attached l_constants.response_fields.at (a_list.index) as l_item then
					Result.put (a_list.item, l_item)
				end
				a_list.forth
			end
		end

	set_base_url (a_url: like base_url)
			-- Set base_url with `a_url'
		do
			base_url := a_url
		ensure
			base_url_set: base_url = a_url
		end

end
