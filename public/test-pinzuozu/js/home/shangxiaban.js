(function(){
	var LINES = [
		{
			id:1,
			start:'北京',
			end:'廊坊',
			startTime:'2014-09-09',
			seat:3
		},
		{
			id:2,
			start:'长沙',
			end:'岳阳',
			startTime:'2014-09-10',
			seat:2
		},
		{
			id:3,
			start:'成都',
			end:'上海',
			startTime:'2014-09-11',
			seat:4
		}
	];

	//上下班拼车Model
	var Line = can.Model({
		findAll:'GET /lines',
		findOne:'GET /lines/{id}',
		create:'POST /line',
		update:'PUT /lines/{id}',
		destroy:'DELETE /lines/{id}'
	},{});

	//没有服务端数据时，模拟返回数据
	var id = 4;
	can.fixture('GET /line',function(){
		return {id:(id++)};
	});
	can.fixture('GET /lines',function(){
		return [LINES];
	});

	var ShangxiabanList = can.Control({
		init:function(){
			this.element.html(
				can.view('views/shangxiaban/shangxiabanList.ejs',{lines:this.options.lines})
			);
		}
	});

	$(document).ready(function() {
		//alert("上下班拼车");
		Line.findAll({},function(lines){
			new ShangxiabanList("#shangxiaban",{lines:lines});
		});
	});

})();