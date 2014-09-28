(function(namespace) {
	
	RouteDriverDetail = can.Control({
		init:function(element,options){
			if(this.options.route === 'driver_detail'){
				this.showRouteDriverDetail();
			}
		},
		showRouteDriverDetail:function(){
			var isLogin = false;

			var userid = this.options.secret.attr("userid");
			var nickname = this.options.secret.attr("nickname");
			var token = this.options.secret.attr("token");
			var login = this.options.secret.attr("login");

			if(nickname != null && nickname != ""){
				isLogin = true;
			}
			var id = can.route.attr("id");
			console.log("id=="+can.route.attr("id"));
			var self = this;
			Line.findOne({id:id},function(line){
				console.log(line.extras.user_avatar_url);
				self.element.html(can.view(
					"js/app/views/detail/driver_detail.ejs",{line:line}
				));

				$("#header-top").html(can.view(
					"js/app/views/head/headTop.ejs",{isLogin:isLogin,username:nickname}
				));
				$("#header-bottom").html(can.view(
					"js/app/views/head/headBottom.ejs"
				));
				$("#footer").html(can.view(
					"js/app/views/footer/footer.ejs"
				));
			},function(error){
				console.log(error);
			});

			
			//$("#menu-route").parent().addClass('current');
		},
		'driver_detail route':function(){
			this.showRouteDriverDetail();
		},
		'#lookContact click':function(el,event){//查看联系方式
			var userid = this.options.secret.attr("userid");
			var token = this.options.secret.attr("token");
			var login = this.options.secret.attr("login");
			if(token == null || token == ""){
				can.route.attr("route","login");
			}else{
				$("#mymodal").modal('show');
			}
		},
		'#passenger-submit click':function(el,event){//申请加入
			var userid = this.options.secret.attr("userid");
			var token = this.options.secret.attr("token");
			var login = this.options.secret.attr("login");
			if(token == null || token == ""){
				can.route.attr("route","login");
			}else{
				//TODO 申请数量
				Order.joinLine({
					auth_token:token,
					login:login,
					userid:userid,
					line_participants:line_participants
				},function(order){
					console.log(order);
				},function(error){
					console.log(error);
				});
			}
		},
		'#seatCount change':function(el,event){
			//alert(el.val());
			var priceCoute = (el.val()*$("#single-price").val()).toFixed(1);
			$("#priceCount").val(priceCoute);
		}
        
	});

	can.extend(namespace,{
		RouteDriverDetail:RouteDriverDetail
	})
})(window);