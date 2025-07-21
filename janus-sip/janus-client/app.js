let janus = null;
let sipHandle = null;

const status = (msg) => (document.getElementById("status").textContent = msg);

document.getElementById("callBtn").addEventListener("click", startCall);

function startCall() {
  Janus.init({
    debug: "all",
    callback: () => {
      if (!Janus.isWebrtcSupported()) {
        status("WebRTC not supported");
        return;
      }

      janus = new Janus({
        server: ENV.JANUS_SERVER,
        success: () => {
          janus.attach({
            plugin: "janus.plugin.sip",
            success: (pluginHandle) => {
              sipHandle = pluginHandle;
              status("SIP plugin attached, registering...");

              sipHandle.send({
                message: {
                  request: "register",
                  username: ENV.SIP_USERNAME,
                  secret: ENV.SIP_PASSWORD,
                  proxy: ENV.SIP_PROXY,
                  display_name: ENV.DISPLAY_NAME
                }
              });
            },
            onmessage: (msg, jsep) => {
              if (msg.result?.event === "registered") {
                status("SIP registered! Calling...");

                sipHandle.createOffer({
                  media: { audio: true, video: false },
                  success: (jsep) => {
                    sipHandle.send({
                      message: {
                        request: "call",
                        uri: ENV.TARGET_NUMBER
                      },
                      jsep
                    });
                  },
                  error: (err) => {
                    status("WebRTC offer error: " + err);
                  }
                });
              } else if (msg.result?.event === "calling") {
                status("Calling...");
              } else if (msg.result?.event === "accepted") {
                status("Call accepted!");
                if (jsep) sipHandle.handleRemoteJsep({ jsep });
              } else if (msg.result?.event === "hangup") {
                status("Call ended: " + msg.result?.reason);
              }
            },
            onremotestream: (stream) => {
              const audio = document.createElement("audio");
              audio.autoplay = true;
              audio.srcObject = stream;
              document.body.appendChild(audio);
            },
            oncleanup: () => status("Cleanup complete")
          });
        },
        error: (err) => {
          status("Janus init error: " + err);
        },
        destroyed: () => status("Janus destroyed")
      });
    }
  });
}
