note
	description: "Summary description for {APPLICATION}."
	author: ""
	date: "$Date: 2013-07-12 15:58:35 -0300 (vie, 12 jul 2013) $"
	revision: "$Revision: 142 $"

deferred class
	APPLICATION_LAUNCHER

feature {NONE} -- Launcher

	launch (a_service: WSF_SERVICE; opts: detachable WSF_SERVICE_LAUNCHER_OPTIONS)
		local
			launcher: WSF_SERVICE_LAUNCHER
		do
			create {WSF_DEFAULT_SERVICE_LAUNCHER} launcher.make_and_launch (a_service, opts)
		end

end

