// Don't expose real secrets in production! Use HTTPS and auth protection.
const ENV = {
  JANUS_SERVER: "wss://your-domain.com/ws",  // Your proxied Janus WebSocket
  SIP_USERNAME: "your-voip-username@sip.voip.ms",
  SIP_PASSWORD: "your-voip-password",
  SIP_PROXY: "sip:sip.voip.ms",
  DISPLAY_NAME: "Web Client",
  TARGET_NUMBER: "sip:15145551234@sip.voip.ms" // PSTN target
};
