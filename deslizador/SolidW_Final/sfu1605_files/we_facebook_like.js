/**
 * @Class FBLike 处理facebook like插件初始化
 * 
 * @author jintian.zhengjt
 */
var FBLike = FBLike || (function(){
		//以js方式引入like时需要加载的脚本链接
	var scriptUrl = "http://connect.facebook.net/en_US/all.js#xfbml=1",
	
		//以iframe方式引入时iframe的src
		iframeUrl = "http://www.facebook.com/widgets/like.php?layout=standard&show_faces=0&width=230&height=35" ,
		
		//页面上预先部署的like iframe容器
		likeFrame = get("fblike-frame"),
		
		//加载loading icon
		likeLoading = get("like-loading");
		
	return  {
		/**
		 * 为config.target绑定like按钮的初始化
		 * 
		 * @param {Object} config
		 */
		live : function(config){
			
			if(typeof config == "undefined" || !config){
				return;
			}
			
			var target = config.target,
				style = config.style ||  "standard",
				width = config.width || "240";
				
			if(!target){
				return;
			}
			
			// fix bug, the like button can not display
			// reset the target's id will be ok 
			target.id = "fb-root";
			
			var metaEls = document.getElementsByTagName("meta"),
				url="";
			
			//使用meta里面的一个og:url标签的内容来作为iframe的src
			for(var i = metaEls.length ; i-- ; ){
				if(metaEls[i].getAttribute("property") == "og:url"){
					url = metaEls[i].getAttribute("content");
				}
			}
			
			var onLikeLoad = function(){
				YUD.setStyle(likeLoading,"display","none");
				YUD.setStyle("fb-like","overflow","visible");
				YUD.setStyle(target,"display","block");
			}

			if(0 && likeFrame){
				YUE.onDOMReady(function(){
					//实际处理iframe加载的代码
					likeFrame.src = iframeUrl + "&href=" + encodeURIComponent(url);
					likeFrame.onload = function(){
						onLikeLoad();
					};
				});
				
			}else{
				target.innerHTML = '<fb:like show_faces="false" width="'+width+'" height="60"></fb:like>';
				YAHOO.util.Get.script(scriptUrl,{
					onSuccess : function(){
						onLikeLoad();				
					},
					onTimeout : function(){						
						YUD.setStyle("fb-like","display","none");	
						YUD.setStyle(likeLoading,"display","none");	
					},
					timeout : 5000
				});
			}
			
			return this;	
		}
	};		
})();
/**
 * detail 以及 store detail上的初始化代码
 */
