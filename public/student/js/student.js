(function(){
	
	var STUDENTS = [
		{
			id: 1,
			name: 'William',
			age: '23',
			email: 'william@husker.com',
		},
		{
			id: 2,
			name: 'Laura',
			age: '26',
			email: 'laura@starbuck.com',
		},
		{
			id: 3,
			name: 'Lee',
			age: '32',
			email: 'lee@apollo.com',
		}
	];

	var Student = can.Model({
		findAll: 'GET /students',
		findOne: 'GET /students/{id}',
		create: 'POST /student',
		update: 'PUT /students/{id}',
		destroy: 'DELETE /students/{id}'
	},{});

	var students = new Student.List(STUDENTS);


	//没有服务端数据时，模拟返回数据
	var id= 4;
	can.fixture("POST /student", function(){
		// just need to send back a new id
		return {id: (id++)};
	});

	can.fixture('GET /students', function(){
		return [STUDENTS];
	});

	var StudentWidget = can.Control({
		init:function(){
			this.element.html(
				can.view('views/students.ejs',{students:this.options.students})	
			);
		}
	});

	//不行
	/*var StudentWidget2 = can.Control({
		defaults:{
			age:'32',
			mail:'admin@admin.com'
		}
	},{
		init:function(element,options){
			var self = this;
			Student.findAll({},function(students){
				self.element.html(
					can.view('students.ejs',students)	
				);
			});
		}
	});*/

	var stu = new Student({
		id:0,
		name:"yisiwei",
		age:"111",
		email:"yisiwei@yisiwei.com"
	});

	var Greeting = can.Control.extend({
		defaults:{
			message:"defaults merged into this.options"
		}
	},{
		init:function(){
			this.element.val(this.options.message)
		}
	});

	$(document).ready(function(){
		//alert(students[1].name);
		
		//测试1
		//$('#content').html(can.view("student.ejs",{student:stu}));
		
		//测试2
		//new StudentWidget('#content',{students:students});

		//测试3 不行
		//new StudentWidget2('#content',{name:'zhangsan',age:'72'});

		//测试4
		// $.when(Student.findAll()).then(function(stus){
		// 	//alert(stus[2].name);
		// 	new StudentWidget('#content',{students:stus});
		// });

		//测试5
		Student.findAll({},function(stus){
			//alert(stus[2].name);
			new StudentWidget('#content',{students:stus});
		});
		//alert("b");
	});
	
	$("#show-text").click(function(){
		new Greeting("#greeting",{message:"hello"});
		//$("#greeting").val("bbb");
	});

})();