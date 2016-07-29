class Notifier

	attr_accessor :gcm_key, :gcm

	def intialize
		@gcm_key = "AIzaSyA7pWPQ07dB1EWha_vD3trpF5fsE-eqAtM"
		@gcm = GCM.new("AIzaSyA7pWPQ07dB1EWha_vD3trpF5fsE-eqAtM")
	end

	def send
		ids = ["ekLGi6RJwn8:APA91bF4d_gBFuRyinOn62kdsUjVw7ceGA7HPRWTjipntEp5ScPJcapLdSkN2c2lYTZdTmLaaHWKCAEzu9ow8tn7pQbhd3Lq1Cy_JzLmgb97_dtbHYsqsrf-3-7gQGaliBB3OaAclyfE"]

		options = {
			data: {
				title: "test",
				message: "asdsds",
				payload: {"$state": "tab.feedback"}
			}
		}

		gcm.send(ids, options)
	end

end
