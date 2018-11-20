new Vue({
	el: '#app',
	methods: {
		goPremium: function() {
			swal('Go Premium', 'Anda harus membayar untuk membuka fitur ini', 'warning');
		}
	}
})