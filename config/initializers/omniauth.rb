Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook,"191896584329030","4c02402d3d531795185f0ed63f55090a"
#	Settings.OmniAuth.facebook.191896584329030,
#	Settings.OmniAuth.facebook.4c02402d3d531795185f0ed63f55090a,
#	display: 'popup'
end

