// 发布线路
/*date start*/
    $(document).ready(function() {
      // $('#backtime').hide();
      var d=new Date();
      var todayMonth=d.getMonth()+1;
      var todaydate=d.getFullYear()+"-"+todayMonth+"-"+d.getDate();
      $('#d').val(todaydate);
      $('#db').val(todaydate);
       $("#ifback").click(function(){   
        alert($("#ifback").prop("checked"));
        if($("#ifback").prop("checked")==true){   
            $('#backtime').hide();  
        }else{   
            $('#backtime').show();
        } 
    })
    }); 
/*date end*/
















