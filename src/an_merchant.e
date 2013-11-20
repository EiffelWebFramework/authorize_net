note
	description: "Object that represent a Merchant and hold authentication values"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=24"

class
	AN_MERCHANT

create
	make_sandbox,
	make_production

feature {NONE} -- Initialization

	make_sandbox (a_login: READABLE_STRING_32; a_transaction_key: READABLE_STRING_32)
			-- Create an object merchant with login and transaction key
			-- using a sandbox environment
		do
			create environment.make
			set_login (a_login)
			set_transaction_key (a_transaction_key)
		ensure
			login_set : login = a_login
			transation_key_set : transaction_key = a_transaction_key
		end

	make_production (a_login: READABLE_STRING_32; a_transaction_key: READABLE_STRING_32)
			-- Create an object merchant with login and transaction key
			-- using a production environment
		do
			create environment.make
			environment.mark_production
			set_login (a_login)
			set_transaction_key (a_transaction_key)
		ensure
			login_set : login = a_login
			transation_key_set : transaction_key = a_transaction_key
		end

feature -- Access

	environment: AN_ENVIRONMENT
			-- Environment to post transactions

	login: STRING_32
			-- Unique API id login

	transaction_key: STRING_32
			-- The merchant's unique Transaction Key

	allow_partial_auth: BOOLEAN
			--is enabled for partial authorization?

	md5_value: detachable STRING_32

	market_type: detachable AN_MARKET_TYPE
			--  market_type

	device_type: detachable AN_DEVICE_TYPE
			-- device type


	transaction : detachable AN_TRANSACTION
		-- associated transaction

feature -- Change Element

	set_environment (env: AN_ENVIRONMENT)
			-- Set `environment' to `env'
		do
			environment := env
		ensure
			environment_set: environment = env
		end

	set_login (a_login: STRING_32)
			--Set `login' to `a_login'
		require
			upto20_characters: a_login.count <= 20
		do
			login := a_login
		ensure
			login_set: login.same_string (a_login)
			upto20_characters: login.count <= 20
		end

	set_transaction_key (a_transaction_key: READABLE_STRING_32)
			-- Set `transaction_key' to `a_transaction_key'
		require
			upto16_characters: a_transaction_key.count <= 16
		do
			transaction_key := a_transaction_key
		ensure
			transaction_key_set: transaction_key.same_string (a_transaction_key)
			upto16_characters: transaction_key.count <= 16
		end

	set_allow_partial_auth (val: BOOLEAN)
			-- Set `allow_partial_auth' to `val'
		do
			allow_partial_auth := val
		ensure
			allow_partial_auth_set: allow_partial_auth = val
		end

	set_md5_value (md5: READABLE_STRING_32)
			-- Set `md5_value' to `md5'
		do
			md5_value := md5
		ensure
			md5_value_set: attached md5_value as l_md5_value and then l_md5_value.same_string (md5)
		end

	set_market_type (a_market_type: AN_MARKET_TYPE)
			-- Set `market_type' to `a_market_type'
		do
			market_type := a_market_type
		ensure
			market_type_set: market_type = a_market_type
		end

	set_device_type (a_device_type: AN_DEVICE_TYPE)
			-- Set `device_type' to `a_device_type'
		do
			device_type := a_device_type
		ensure
			device_type_set: device_type = a_device_type
		end


feature {NONE} -- Implement

invariant
	login_upto20_characters: login.count <= 20
	transaction_key_upto16_characters: transaction_key.count <= 16

end
