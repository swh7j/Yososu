
 
   $(document).ready(function(){
       $("#keyword1").keyup(function() {
           var b = $(this).val();
           $("#txt > tbody > tr").hide();
           var temp2 = $("#txt > tbody > tr > td:nth-child(2n):contains('" + b + "')");
           var temp3 = $("#txt > tbody > tr > td:nth-child(2n-1):contains('" + b + "')");
           $(temp2).parent().show();
           $(temp3).parent().show();
     })
})
   
   

   
   function btnwrite(){
      var title = document.getElementById("title").value; 
      var contents = document.getElementById("contents").value;
      var writer = document.getElementById("writer").value;
      var pw = document.getElementById("pw").value;
      $.ajax({ 
         url : "boardwritecontroller.jsp",
         data : { title : title , contents : contents, writer: writer, pw:pw},
         success : function(result) {
        	
            if(result==1){location.href="index.jsp";}
            
         }    
            
      });
      
   }
   
 
 function bupdate(b_num){
	
	
     var pwconfirm1 = $("#pwconfirm1").val();
     var title = document.getElementById("title1").value; 
     var contents = document.getElementById("contents1").value;
    $.ajax({
       url: "boardupdatecontroller.jsp",
       data: {"b_num":b_num,"pwconfirm1":pwconfirm1, title : title , contents : contents},
       success: function(result){
    	 
    	   if(result==1){
    		  
        	  $('#modalupdate').modal('show'); 
        		
          } else if(result==2){
        	  alert("비밀번호가 다릅니다. 다시 입력해주세요.");
         		 location.href="index.jsp";
          }

       }
   }); 
}
   
   
 
 function btnupdate(b_num){
     var b_num = b_num;
     var title = document.getElementById("title1").value; 
     var contents = document.getElementById("contents1").value;
     $.ajax({ 
           url : "boardupdatecontroller2.jsp",
           data : {title : title , contents : contents, b_num:b_num},
           success : function(result) {
        	   location.href="index.jsp";
               
       
           }    
              
        });
 
 } 
    

 function btndelete(b_num) {
	  var b_num = b_num;
	  var pwconfirm2 = $("#pwconfirm2").val();
	 	 $.ajax({ 
         url : "boarddeletecontroller.jsp",
         data : {"b_num":b_num,"pwconfirm2":pwconfirm2},
         success : function(result) {
       	 
        	 if(result==1){
        		 alert("삭제되었습니다.");
            	 location.href="index.jsp";
             } else if(result==2){
            	 alert("비밀번호가 다릅니다. 다시 입력해주세요.");
            	 location.href="index.jsp";
             }
             
         }    
            
      }); 
  }        
      
  
    function btnview(b_num){
        var b_num = b_num;
        $.ajax({ 
              url : "boardviewcontroller.jsp",
              data : { b_num:b_num},
              success : function(result) {
                    $("#modaltest1").empty();
                    $("#modaltest1").prepend(result);

              }    
                 
           });
    
    }


   



$(document).ready(function(){
       $("#keyword").keyup(function() {
           var k = $(this).val();
           $("#item-table > tbody > tr").hide();
           var temp = $("#item-table > tbody > tr > td:nth-child(2n):contains('" + k + "')");
           var temp1 = $("#item-table > tbody > tr > td:nth-child(2n-1):contains('" + k + "')");
           $(temp).parent().show();
           $(temp1).parent().show();
     })
})




function chageSelect(){ 
   var select = document.getElementById("test").value; 
   location.href = "index.jsp?cartegory="+select;

}   




/* kakao 지도 start */
function map( code , lat , lng ){

	if(code==null){
		  // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	       navigator.geolocation.getCurrentPosition(function(position) {
	           
	           var lat = position.coords.latitude, // 위도
	               lon = position.coords.longitude; // 경도


				var mapContainer = document.getElementById('map'),
				    mapOption = { 
				        center: new kakao.maps.LatLng(lat, lon),
				        level: 7 // 지도의 확대 레벨
				    };
					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					
					var radius = 10000;        
					
					var latlngyo = new daum.maps.LatLng(lat, lon);

					
				$.ajax({
					url : "apicontroller.jsp",
					data : { "lat" : lat , "lon" : lon },
					success:function(data){
					
						var list = data;
						
						/*alert(list);*/
						var list2 = list.split(","); // 주유소별 분리 
						//alert( list2[0] );
						//var list3 = list2[0].split("/"); // 개별 주유소내 분리 					
						/*alert( list3[0] ); // 주유소
						alert( list3[1] );	
						alert( list3[2] );
						alert( list3[3] );*/
									
						var circle = new daum.maps.Circle({
						    map: map,
						    center : latlngyo,
						    radius: radius,
						    strokeWeight: 2,
						    strokeColor: '#FF00FF',
						    strokeOpacity: 0.8,
						    strokeStyle: 'dashed',
						    fillColor: '#D3D5BF',
						    fillOpacity: 0.5
						});
						
						var marker = new daum.maps.Marker({
						 position: latlngyo, // 마커의 좌표
						 title: "My Location!!",
						 map: map          // 마커를 표시할 지도 객체
						});
						
									// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
							daum.maps.event.addListener(marker, 'click', function() {
							    alert('My Location!!');
							});
						
						var arr =  new Array();
						
						for(var i=0; i<list2.length; i++){
							
							arr[i] = list2[i].split("/");
								

						}
					
						var markerTmp;      // 마커
						var polyLineTmp;    // 두지점간 직선거리
						
						for (var j=0;j<arr.length;j++) {
							//alert(arr[j]);
							//alert(arr.length);
							
							if(j==arr.length-1){
	                           //alert(arr[j][arr.length-1].split("]")[0]);
	                           arr[arr.length-1][6] = arr[arr.length-1][6].split("]")[0];
	                                                     
	                      	}
							let name =arr[j][0];
							let addr =arr[j][1];
							let tel =arr[j][2];
							let inventory =arr[j][3];
							let price =arr[j][4];
							let lat5 =arr[j][5];
							let lng5 =arr[j][6];
						    	markerTmp = new daum.maps.Marker({
						        position: new daum.maps.LatLng(arr[j][5],arr[j][6]),
								title: arr[j][0],
						        map:map
						    });
										// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
							daum.maps.event.addListener(markerTmp, 'click', function() {
								
							// 커스텀 오버레이를 생성하고 지도에 표시한다
								var customOverlay = new kakao.maps.CustomOverlay({
									map: map,
									content: "<div style='padding:10px; width:450px; height:140px; background-color:white;'>"+
												"<span> 상호명 : "+name+"</span><br>"+
												"<span> 주유소 주소 : "+addr+"</span><br>"+
												"<span> 주유소 번호 : "+tel+"</span><br>"+
												"<span> 요소수 재고량 :"+inventory+"</span><br>"+
												"<span> 요소수 가격 :"+ price+"</span><br>"+
												"</div>", 
									position: new kakao.maps.LatLng(lat5, lng5), // 커스텀 오버레이를 표시할 좌표
									xAnchor: 0.5, // 컨텐츠의 x 위치
									yAnchor: 0 // 컨텐츠의 y 위치
								});

							    
							});
							
						
	
						
					}
										
		         }
				});
				

	});	
		  
   
	} else{
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		   var mapOption = { 
		           center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표 [ 위도 , 경도 ]
		           level: 3 // 지도의 확대 레벨 [ 1 : 최대 확대 ~~~  ]
		           
		       };
		   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		   var map = new kakao.maps.Map(mapContainer, mapOption); 

		    
		         // 마커를 표시할 위치입니다 
		      var position =  new kakao.maps.LatLng(lat, lng);

		      // 마커를 생성합니다
		      var marker = new kakao.maps.Marker({
		        position: position
		      });

		      // 마커를 지도에 표시합니다.
		      marker.setMap(map); 
		  
		      $.ajax({ 
		         url : "controller.jsp" ,   
		         data :{ "code":code } ,    
		         success : function( result ){ 
		   
		                  // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		                  var iwContent = result

		                  // 인포윈도우를 생성합니다
		                  var infowindow = new kakao.maps.InfoWindow({
		                      content : iwContent
		                  });

		                  // 마커에 마우스오버 이벤트를 등록합니다
		                  kakao.maps.event.addListener(marker, 'mouseover', function() {
		                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		                      infowindow.open(map, marker);
		                  });

		                  // 마커에 마우스아웃 이벤트를 등록합니다
		                  kakao.maps.event.addListener(marker, 'mouseout', function() {
		                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		                      infowindow.close();
		                  });
		         }
		      });
		
		
	}
	
     
} 

