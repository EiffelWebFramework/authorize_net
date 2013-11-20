note
	description: "Objects that represent and {AN_ORDER}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"
	EIS: "name=AIM Guide", "protocol=PDF", "src=http://www.authorize.net/support/AIM_guide.pdf", "page=28"
	EIS: "name=Merchant Guide", "protocol=PDF", "src=http://www.authorize.net/support/merchant_guide.pdf", "page=41"

class
	AN_ORDER

feature -- Access

	order_items: detachable LIST [AN_ORDER_ITEM]
			-- `order_items'

	shipping_charges: detachable AN_SHIPPING_CHARGES
			-- `shipping_charges'

	total_amount: DOUBLE
			-- `total_amount'

	description: detachable STRING_32
			-- `description'

	purchase_order_number: detachable STRING_32
			-- `purchase_order_number'

	invoice_number: detachable STRING_32
			-- `invoice_number'

feature -- Element change

	set_order_items (an_order_items: like order_items)
			-- Assign `order_items' with `an_order_items'.
		require
			valid_order_item_size :attached an_order_items as l_order_items and then l_order_items.count <= 25
		do
			order_items := an_order_items
		ensure
			order_items_assigned: order_items = an_order_items
		end

	add_item (item: AN_ORDER_ITEM)
			-- Add `ITEM' to the list of items
		require
			item_size :attached order_items as l_order_items implies l_order_items.count < 25
		local
			l_items: like order_items
		do
			l_items := order_items
			if l_items = Void then
				create {ARRAYED_LIST [AN_ORDER_ITEM]} l_items.make(10)
				order_items := l_items
			end
			l_items.force (item)
		end

	set_shipping_charges (a_shipping_charges: like shipping_charges)
			-- Assign `shipping_charges' with `a_shipping_charges'.
		do
			shipping_charges := a_shipping_charges
		ensure
			shipping_charges_assigned: shipping_charges = a_shipping_charges
		end

	set_total_amount (a_total_amount: like total_amount)
			-- Assign `total_amount' with `a_total_amount'.
		do
			total_amount := a_total_amount
		ensure
			total_amount_assigned: total_amount = a_total_amount
		end

	set_description (a_description: READABLE_STRING_32)
			-- Assign `description' with `a_description'.
		require
			valid_description : a_description.count <= 255
		do
			description := a_description
		ensure
			description_assigned: description = a_description
		end

	set_purchase_order_number (a_purchase_order_number: like purchase_order_number)
			-- Assign `purchase_order_number' with `a_purchase_order_number'.
		do
			purchase_order_number := a_purchase_order_number
		ensure
			purchase_order_number_assigned: purchase_order_number = a_purchase_order_number
		end

	set_invoice_number (an_invoice_number: READABLE_STRING_32)
			-- Assign `invoice_number' with `an_invoice_number'.
		require
			valid_invoice_number : an_invoice_number.count <= 20
		do
			invoice_number := an_invoice_number
		ensure
			invoice_number_assigned: invoice_number = an_invoice_number
		end

end
