note
	description: "[
		application service
	]"
	date: "$Date: 2013-07-12 15:58:35 -0300 (vie, 12 jul 2013) $"
	revision: "$Revision: 142 $"

class
	EWF_AUTHORIZE_NET

inherit

	WSF_LAUNCHABLE_SERVICE
		redefine
			initialize
		end

	WSF_ROUTED_SERVICE

	WSF_URI_TEMPLATE_HELPER_FOR_ROUTED_SERVICE

	APPLICATION_LAUNCHER

create
	make_and_launch

feature {NONE} -- Initialization

	initialize
			-- Initialize current service.
		do
			Precursor
			set_service_option ("port", 9090)
			initialize_router
		end

	setup_router
			-- Setup `router'
		local
			fhdl: WSF_FILE_SYSTEM_HANDLER
		do
			map_uri_template_agent_with_request_methods ("/payment_aim", agent handle_payment_aim, router.methods_POST)
			router.handle_with_request_methods ("/doc", create {WSF_ROUTER_SELF_DOCUMENTATION_HANDLER}.make (router), router.methods_GET)
			create fhdl.make_hidden ("www")
			fhdl.set_directory_index (<<"index.html">>)
			router.handle_with_request_methods ("", fhdl, router.methods_GET)
		end

	handle_payment_aim (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			v: READABLE_STRING_32
			s: STRING
			a_merchant: AN_MERCHANT
			l_executor: AN_TRANSACTION_EXECUTOR
			l_transaction: AN_AIM_TRANSACTION
			l_transaction_type: AN_TRANSACTION_TYPE
			l_answer: AN_RESPONSE
			l_credit_card: AN_CREDIT_CARD
			l_customer: AN_CUSTOMER
			l_result: BOOLEAN
			l_response: STRING
			l_rows : STRING
		do
			l_result := False
			create l_rows.make_empty
				-- set Customer
			create l_customer
			if attached req.form_parameter ("first_name") as l_first_name then
				l_customer.set_first_name (l_first_name.as_string.value)
			end
			if attached req.form_parameter ("last_name") as l_last_name then
				l_customer.set_last_name (l_last_name.as_string.value)
			end

				-- set Credit Card

			if attached req.form_parameter ("cc_card_num") as l_credit_card_num and then
				is_valid_credit_card_number (l_credit_card_num.as_string.value) and then
				 attached req.form_parameter ("expiry_month") as l_expiry_month and then
				 attached req.form_parameter ("expiry_year") as l_expiry_year  then
				create l_credit_card.make (l_credit_card_num.as_string.value,l_expiry_month.as_string.value + l_expiry_year.as_string.value )
				if attached req.form_parameter ("amount") as l_amount then
					if l_amount.as_string.value.is_double then
							-- Create a transaction type auth_capture
						create l_transaction_type.make
						l_transaction_type.mark_auth_capture

							-- Create a merchant
						create a_merchant.make_sandbox ("5ZDctVvu5Y99", "265dz3TTu28CmeWD") -- login and transaction key

							-- Create a new transaction aim with a merchant an a transaction type
						l_transaction := (create {AN_TRANSACTION_FACTORY}).new_aim_transaction (a_merchant, l_transaction_type, l_amount.as_string.value.to_double)
						l_transaction.set_credit_card (l_credit_card)
						l_transaction.set_customer (l_customer)
						create l_executor.make (a_merchant, l_transaction)
						l_answer := l_executor.execute_aim_transaction
						l_result := l_answer.response_code.is_approved
						from
							l_answer.response_fields.start
						until
							l_answer.response_fields.after
						loop
							 l_rows.append ("<tr><td>"+l_answer.response_fields.key_for_iteration + "</td>")
							 l_rows.append ("<td>"+l_answer.response_fields.item_for_iteration + "</td></tr>")
							 l_answer.response_fields.forth
						end
					end
				end
			end
			create l_response.make_from_string (html_page)
			l_response.replace_substring_all ("$l_result", l_result.out)
			l_response.replace_substring_all ("$rows", l_rows)
			res.set_status_code ({HTTP_STATUS_CODE}.ok)
			res.put_header_line ("Content-Type: text/html")
			res.put_header_line ("Content-Length: " + l_response.count.out)
			res.put_string (l_response)

		end

feature -- validations
	is_valid_credit_card_number (a_credit_card_number : STRING_32) : BOOLEAN
		-- is `a_credit_card_number' a valid credit card number?
		do
			Result := a_credit_card_number.count >= 13 and then  a_credit_card_number.count <= 16
		end


feature -- Html response page
	html_page: STRING = "[
			<!DOCTYPE HTML>
			<head>
				<head>
					<head>
						<title>Authorize.Net AIM integration method Results</title>
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<link rel="stylesheet" href="/vendor/bootstrap-2.3.1/css/bootstrap.css" media="screen">
					</head>
				</head>
				<body>
					<div class="container-narrow">
					<div class=""masthead">
					<div class="nav-collapse collapse">
    		        <ul class="nav">
            		 <li class="active"><a href="/">Home</a></li>
            		 </ul>
            		</div>
            		 </div>
					<p>The result was : $l_result </p>
					<br>
					<p>Authorize.Net Response </p>
					<div class="span5">
					<table class="table table-striped table-condensed">
						  <thead>
						  <tr>
							  <th>Fieldname</th>
							  <th>Description</th>
						  </tr>
					  </thead>

							$rows
						</tbody>
					</table>
				 </table>
				 </div>
				 </div>	
				</body>
			</head>
		]"

end
