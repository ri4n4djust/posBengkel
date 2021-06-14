<template>
    <div class="mt-3">
<form id="2" method="GET" action="//ypec-sss.yamaha-motor.co.jp/ypec/ypec/b2c/html5/app/in/parts-search/index.html" target="_PartsCatalogue">
                  
              </form>
  <iframe width="100%" height="600" src="//ypec-sss.yamaha-motor.co.jp/ypec/ypec/b2c/html5/app/in/parts-search/index.html"></iframe>
<a href="javascript:open_ypec();" target="_blank">Buka</a>
    </div>   
  
  
</template>
<script>
  export default {
        data() {
            return {
               
            }
        },

       created() {
          //this.get();
        },

        methods: {
          open_ypec() {
                  var w = window.open("", "_PartsCatalogue", "width=1000, height=700, menubar=no, toolbar=no, scrollbars=yes, resizable=yes, status=yes");
                  var form = document.forms[2];
                  form.target = w.name;
                  form.submit();
                }
            
        },
        
    }
</script>

