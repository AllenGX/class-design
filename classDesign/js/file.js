/**
 * 
 */

		var file=document.getElementById("FIle");
		function f5(){
			file.style.display="none";
		}
		function f6(){
			file.style.display="inline";
		}
/*		var fileInto=document.getElementById("file");*/
		function fileInto(){
			f6();
		}
		
		//预览图片
		function preview(target){
		    var length=0;
		    var imgContent=document.getElementById('img_upload');  
		//imgContent为图片展示的区域
		    var reader=new FileReader();
		    reader.readAsDataURL(target.files[length]);    
		//异步读取图片，读取完会触onload
			imgContent.innerHTML="";
		    reader.onload=function(){
		            imgContent.innerHTML+="<li class=\"item\"><img src='"+this.result+"'/></li>";
		            length++;
		            if(length<target.files.length){
		                reader.readAsDataURL(target.files[length]); 
		            }
			}
		    f5();
		}
