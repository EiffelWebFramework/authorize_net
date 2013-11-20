note
	description: "Determines which environment to post transactions against."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AuthorizeNet AIM Method", "src=http://www.authorize.net/support/AIM_guide.pdf", "protocol=url", "page=23"

class
	AN_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Create an environment object, by default in sandbox
		do
			mark_sandbox
		end

feature -- Access

	gateway : STRING_32

	test_mode : BOOLEAN

	Production_gateway_api_url: STRING_32 = "https://secure.authorize.net/gateway/transact.dll"

	Sandbox_gateway_api_url: STRING_32 = "https://test.authorize.net/gateway/transact.dll"

feature -- Change Element

	mark_sandbox
		do
			gateway := Sandbox_gateway_api_url
		end

	mark_production
		do
			gateway := Production_gateway_api_url
		end

	set_test_mode (a_mode : BOOLEAN)
			-- Set `test_mode' to `a_mode'
		do
			test_mode := a_mode
		ensure
			test_mode_set : a_mode = test_mode
		end
end
