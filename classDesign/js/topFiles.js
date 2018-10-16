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

	function f(){
		var img=getElementsByClass("item");
		if(img.length==0){
			alert("图片不能为空");return false;
		}else{
			return true;
		}
		
	}
	
	function fs(){
		if(f()&&contentIsOk()&&titleIsOk()){
			return true;
		}else return false;
	}