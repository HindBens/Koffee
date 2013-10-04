Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "uuyJu9398GrpxVHc5LOA", "QYp3Mt6TDaWpinLawDI6flRDNpDHMo62Di3cTz888qQ"
  provider :facebook, "225985217565919", "adb08dd5938638d994fa6671d63be729"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE