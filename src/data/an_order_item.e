note
	description: "Objects that represnet an item {AN_ORDER_ITEM} for a given Order"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=28"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=41"


class
	AN_ORDER_ITEM



feature -- Access

	taxable: BOOLEAN
			-- `taxable'

	price: DOUBLE
			-- `price'
		attribute check False then end end --| Remove line when `price' is initialized in creation procedure.

	quantity: INTEGER
			-- `quantity'
		attribute check False then end end --| Remove line when `quantity' is initialized in creation procedure.

	description: detachable STRING_32
			-- `description'

	name: detachable STRING_32
			-- `name'

	id: detachable STRING_32
			-- `id'

feature -- Element change

	set_taxable (an_taxable: like taxable)
			-- Assign `taxable' with `an_taxable'.
		do
			taxable := an_taxable
		ensure
			taxable_assigned: taxable = an_taxable
		end

	set_price (an_price: like price)
			-- Assign `price' with `an_price'.
		do
			price := an_price
		ensure
			price_assigned: price = an_price
		end

	set_quantity (an_quantity: like quantity)
			-- Assign `quantity' with `an_quantity'.
		do
			quantity := an_quantity
		ensure
			quantity_assigned: quantity = an_quantity
		end

	set_description (an_description: READABLE_STRING_32)
			-- Assign `description' with `an_description'.
		require
			is_valid_description_length : an_description.count <= 255
		do
			description := an_description
		ensure
			description_assigned: description = an_description
		end

	set_name (an_name: READABLE_STRING_32)
			-- Assign `name' with `an_name'.
		require
			is_valid_name_length : an_name.count <= 31
		do
			name := an_name
		ensure
			name_assigned: name = an_name
		end

	set_id (an_id: READABLE_STRING_32)
			-- Assign `id' with `an_id'
		require
			is_valid_id_length : an_id.count <= 31
		do
			id := an_id
		ensure
			id_assigned: id = an_id
		end

end
