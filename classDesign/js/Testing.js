/**
 * 
 */

function titleIsOk(){
	var title=document.getElementById("title");
	if(title.value==""||title.value==null){
		alert("标题不能为空");return false;
	}else{
		return true;
	}
}

function contentIsOk(){
	var content=document.getElementById("content");
	if(content.value==""||content.value==null){
		alert("内容不能为空");return false;
	}else{
		return true;
	}
}

/************验证日期**************/

	function timeIsOk(){
		var time=document.getElementById("time");
		var a=time.value.toString();
		var h=parseInt(a.substr(0, 4));
		var m=parseInt(a.substr(5, 7));
		var d=parseInt(a.substr(8, 10));
		var split1=a.charAt(4);
		var split2=a.charAt(7);
		
		//格式没错		月份没错
		if(split1==split2&&split2=="-"&&m<=12&&m>0){

			if(m==1||m==3||m==5||m==7||m==8||m==10||m==12){if(d<=31&&d>0)return true;}		//31天
			else if(m==2){
				if(h%4==0&&h%100!=0||h%400==0){	if(d<=28&&d>0)return true;}			//28天
				else if(d<=29&&d>0)return true;			//28天
				}
			else{
				if(d<=30&&d>0)return true;
			}
		}alert("日期格式错误");return false;
	}
/************验证日期**************/	

/************验证价格**************/
	function pieceIsOk(){
		var piece=parseFloat(document.getElementById("piece").value.toString());
		if(piece>0)return true;
		else{
		alert("价格错误");return false;
		}
	}
 /************验证价格**************/

	
	