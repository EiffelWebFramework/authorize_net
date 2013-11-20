note
	description: "Objects that represent {AN_MARKET_TYPE}. Market Type is used for Card Present transactions, not supported for now."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"

class
	AN_MARKET_TYPE

create
	make
	
feature --{NONE}

	make
		do
			mark_retail
		end

feature -- Access

	market_type : INTEGER_32

feature -- Status Report

	is_valid_market (s : INTEGER) : BOOLEAN
		do
		inspect s
				when Retail then
					Result := True
				else
				end
		end

	is_retail : BOOLEAN
		do
			Result := market_type = Retail
		end

feature -- Change Market Type

	set_market_type (a_market_type : INTEGER_32)
		require
			valid_market_type: is_valid_market (a_market_type)
		do
			market_type := a_market_type
		ensure
			market_type_set : market_type = a_market_type
		end

	mark_retail
		do
			set_market_type (Retail)
		end
feature -- Constants
	Retail : INTEGER = 2

invariant
	market_type_set: is_valid_market (market_type)
end
