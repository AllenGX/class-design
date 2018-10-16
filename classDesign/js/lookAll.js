/**
 * 
 */
		function getElementsByClass(classname){
			var elements=new Array();
			var all=document.getElementsByTagName("*");
			for(var i=0;i<all.length;i++){
				var className=all[i].className.split(" ");
				for(var j=0;j<className.length;j++){
					if(className[j]==classname){elements[elements.length]=all[i];break;}
				}
			}
			return elements;
		}
		
		function lookAll(){
			var s=getElementsByClass("number");
			for(var i=0;i<s.length;i++){
				s[i].style.display="block";
			}
		}
		function lookPush(){
			var ss=getElementsByClass("number");
			var s=getElementsByClass("number1");
			
			for(var i=0;i<ss.length;i++){
				ss[i].style.display="none";
			}

			for(var i=0;i<s.length;i++){
				s[i].style.display="block";
			}
		}
		function lookNoPush(){
			var ss=getElementsByClass("number");
			var ss=getElementsByClass("number");
			for(var i=0;i<ss.length;i++){
				ss[i].style.display="block";
			}
			var s=getElementsByClass("number1");
			for(var i=0;i<s.length;i++){
				s[i].style.display="none";
			}
		}