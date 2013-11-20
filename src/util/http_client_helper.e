note
	description: "Summary description for {HTTP_CLIENT}."
	author: ""
	date: "$Date: 2013-08-07 17:55:42 -0300 (mié, 07 ago 2013) $"
	revision: "$Revision: 193 $"

deferred class
	HTTP_CLIENT_HELPER

feature -- Access

	http_session: detachable HTTP_CLIENT_SESSION

	get_http_session
		local
			h: LIBCURL_HTTP_CLIENT
			b: like base_url
		do
			create h.make
			b := base_url
			if b = Void then
				b := ""
			end
			base_url.left_adjust
			base_url.right_justify

			if attached {HTTP_CLIENT_SESSION} h.new_session (base_url) as sess then
				http_session := sess
				sess.set_timeout (-1)
				sess.set_is_debug (True)
				sess.set_connect_timeout (-1)
				sess.set_is_insecure (True)
				sess.set_any_auth_type
--				sess.set_proxy ("127.0.0.1", 8888) --| inspect traffic with http://www.fiddler2.com/								
			end
		end

feature -- HTTP client helpers
	execute_get (command_name: READABLE_STRING_32): detachable HTTP_CLIENT_RESPONSE
		do
			get_http_session
			if attached http_session as sess then
				Result := sess.get (command_name, context_executor)
			end
		end

	execute_post (command_name: READABLE_STRING_32; data: detachable READABLE_STRING_8): detachable HTTP_CLIENT_RESPONSE
		do
			get_http_session
			if attached http_session as sess then
				Result := sess.post (command_name, context_executor, data)
			end
		end

	execute_delete (command_name: READABLE_STRING_32): detachable HTTP_CLIENT_RESPONSE
		do
			get_http_session
			if attached http_session as sess then
				Result := sess.delete (command_name, context_executor)
			end
		end

	execute_put (command_name: READABLE_STRING_32; data: detachable READABLE_STRING_8): detachable HTTP_CLIENT_RESPONSE
		do
			get_http_session
			if attached http_session as sess then
				Result := sess.put (command_name, context_executor, data)
			end
		end

	context_executor: HTTP_CLIENT_REQUEST_CONTEXT
			-- request context for each request
		do
			create Result.make
			Result.headers.put ("text/plain; charset=utf-8", "Content-Type")
			Result.headers.put ("text/plain; charset=utf-8", "Accept")
		end

	base_url : STRING

end
