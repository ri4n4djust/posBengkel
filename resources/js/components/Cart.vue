<template>
   <div class="mt-3">
      <button @click="disconnect" v-if="status === 'connected'">Disconnect</button>
      <button @click="connect" v-if="status === 'disconnected'">Connect </button> {{ status }}
      <button @click="change">{{ message }}</button>
   </div>
</template>

<script>
export default {

	data: function() {
		return {
			message: "desde el content",
			status: "disconnected",
		}
	},
	methods:{

		change(){
			this.status='connected';	
		},

		connect() {
			this.socket = new WebSocket("ws://localhost:8080");
         let vm = this;
			this.socket.onopen = function(openEvent) {
				console.log("ws::open : connection established "+vm.status);	
				this.status = "connected";						
			};

			this.socket.onerror = function (errorEvent) {
				console.log("WebSocket ERROR: " + JSON.stringify(errorEvent, null, 4));
			};

			this.socket.onmessage = function (messageEvent) {
				var wsMsg = messageEvent.data;
					if (wsMsg.indexOf("error") > 0) {
						console.error("ws::msg_in:error: " + wsMsg.error);
					} else {
						console.info("ws::msg_in: " + wsMsg);
					}
			};
		},
	}
}
</script>