note
	description: "Objects that represent shipping charges. tax, freight/shipping, duty"
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=30"
class
	AN_SHIPPING_CHARGES

feature -- Access

	purchase_order_number: detachable STRING_32
			-- `purchase_order_number'

	tax_exempt: BOOLEAN
			-- `tax_exempt'

	duty_amount: DOUBLE
			-- `duty_amount'

	duty_item_description: detachable STRING_32
			-- `duty_item_description'

	duty_item_name: detachable STRING_32
			-- `duty_item_name'

	freight_amount: DOUBLE
			-- `freight_amount'

	freight_description: detachable STRING_32
			-- `freight_description'

	freight_item_name: detachable STRING_32
			-- `freight_item_name'

	tax_amount: DOUBLE
			-- `tax_amount'

	tax_description: detachable STRING_32
			-- `tax_description'

	tax_item_name: detachable STRING_32
			-- `tax_item_name'

feature -- Element change

	set_purchase_order_number (a_purchase_order_number: READABLE_STRING_32)
			-- Assign `purchase_order_number' with `a_purchase_order_number'.
		require
			upto25characters: a_purchase_order_number.count <= 25
		do
			purchase_order_number := a_purchase_order_number
		ensure
			purchase_order_number_assigned: purchase_order_number = a_purchase_order_number
		end

	set_tax_exempt (a_tax_exempt: like tax_exempt)
			-- Assign `tax_exempt' with `a_tax_exempt'.
		do
			tax_exempt := a_tax_exempt
		ensure
			tax_exempt_assigned: tax_exempt = a_tax_exempt
		end

	set_duty_amount (a_duty_amount: like duty_amount)
			-- Assign `duty_amount' with `a_duty_amount'.
		do
			duty_amount := a_duty_amount
		ensure
			duty_amount_assigned: duty_amount = a_duty_amount
		end

	set_duty_item_description (a_duty_item_description: READABLE_STRING_32)
			-- Assign `duty_item_description' with `a_duty_item_description'.
		do
			duty_item_description := a_duty_item_description
		ensure
			duty_item_description_assigned: duty_item_description = a_duty_item_description
		end

	set_duty_item_name (a_duty_item_name: READABLE_STRING_32)
			-- Assign `duty_item_name' with `a_duty_item_name'.
		do
			duty_item_name := a_duty_item_name
		ensure
			duty_item_name_assigned: duty_item_name = a_duty_item_name
		end

	set_freight_amount (a_freight_amount: like freight_amount)
			-- Assign `freight_amount' with `a_freight_amount'.
		do
			freight_amount := a_freight_amount
		ensure
			freight_amount_assigned: freight_amount = a_freight_amount
		end

	set_freight_description (a_freight_description: READABLE_STRING_32 )
			-- Assign `freight_description' with `a_freight_description'.
		do
			freight_description := a_freight_description
		ensure
			freight_description_assigned: freight_description = a_freight_description
		end

	set_freight_item_name (a_freight_item_name: READABLE_STRING_32 )
			-- Assign `freight_item_name' with `a_freight_item_name'.
		do
			freight_item_name := a_freight_item_name
		ensure
			freight_item_name_assigned: freight_item_name = a_freight_item_name
		end

	set_tax_amount (a_tax_amount: like tax_amount)
			-- Assign `tax_amount' with `a_tax_amount'.
		do
			tax_amount := a_tax_amount
		ensure
			tax_amount_assigned: tax_amount = a_tax_amount
		end

	set_tax_description (a_tax_description: READABLE_STRING_32)
			-- Assign `tax_description' with `a_tax_description'.
		do
			tax_description := a_tax_description
		ensure
			tax_description_assigned: tax_description = a_tax_description
		end

	set_tax_item_name (a_tax_item_name: READABLE_STRING_32)
			-- Assign `tax_item_name' with `a_tax_item_name'.
		do
			tax_item_name := a_tax_item_name
		ensure
			tax_item_name_assigned: tax_item_name = a_tax_item_name
		end

end
