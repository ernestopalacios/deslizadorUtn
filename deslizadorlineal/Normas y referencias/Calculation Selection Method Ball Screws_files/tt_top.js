/**
 * 商品PRパネルをAjax非同期で情報を更新する。
 * @param targetDivId	挿入先のdivタグID
 * @param busiCateCd	事業所CD
 */
function prUpdateAsync(targetDivId, busiCateCd) {
	if (document.getElementById(targetDivId)) {
		new Ajax.Updater(targetDivId,
			"/us/PrcommentPanel.html?returnUrl=" + document.URL + "&busiCateCd=" + busiCateCd + "&hoge=" + Math.random(), 
			{asynchronous:true}
		);
	}
}


/* e-カタログへのご意見 */
function openCommentDialog() {
	document.getElementById("opinion_text").value = "";
	document.getElementById("opinion_comment").style.display="block";
	document.getElementById("opinion_thanks").style.display="none";
	document.getElementById("comment_dialog").style.display="block";
	document.getElementById("corp").className = "s04 on";
}
function closeOpinionCommentBox() {
	document.getElementById("opinion_thanks").style.display="none";
	document.getElementById("opinion_comment").style.display="none";
	document.getElementById("comment_dialog").style.display="none";
	document.getElementById("corp").className = "s04";
}
function submitOpinionButton() {
	
	var comment = document.getElementById("opinion_text").value;
	comment = encodeURIComponent(comment);
	
	document.getElementById("opinion_comment").style.display="none";
	document.getElementById("opinion_thanks").style.display="block";
	
	var parameter = "?comment=" + comment;
	registViewrequest("WriteEcCatalogOpinion.html", parameter, true);
}


/*****************************
 * 検索キーワード予測 START
 ****************************/
var onSupportBox = false;
function showSupportBoxSuggest(resultHTMLText) {
	var boxObj = document.getElementById("serviceBox");
	boxObj.style.display = "block";
	boxObj.innerHTML = resultHTMLText;

	if (resultHTMLText.indexOf("</a>") > 0) {
		resizeSupportBox(resultHTMLText);
	} else {
		removeSupportBoxSuggest();
	}
	
	// キー入力のイベントを設定
	document.getElementById("EcSearchForm").kw.onkeydown=catchSupportEvent;
}

function removeSupportBoxSuggest() {
	var boxObj = document.getElementById("serviceBox");
	boxObj.style.display = "none";
	boxObj.innerHTML = "";
}

function setSupportKeyword(supportLinkTag) {
	document.getElementById("EcSearchForm").kw.value = supportLinkTag.innerHTML;
	
	onSupportBox = false;
	releaseSupport();
}

function resizeSupportBox(resultHTMLText) {
	var boxObj = document.getElementById("serviceBox");
	
	if (resultHTMLText && resultHTMLText.split("</a>\n").length >= 9) {
		if (!document.all && (document.layers || document.getElementById)){
			boxObj.style.height = "144px";
		} else {
			boxObj.style.height = "134px";
		}
	} else {
		boxObj.style.height = "auto";
	}
}


var tmpKeyword;
var watchTimer;
function catchKeyword() {
	var formObj = document.getElementById("EcSearchForm");
	var keywordValue = formObj.kw.value;
	var isMissing = document.getElementById("isMissing").value;
	
	if (!isMissing && keywordValue && tmpKeyword != keywordValue) {

		// keyword is changed
		tmpKeyword = keywordValue;
		
		// search support
		var urlHead = formObj.action.substring(0, formObj.action.lastIndexOf("/"));
		var url = urlHead + "/EcSearchKeywordSuggest.html?kw=" + encodeURI(keywordValue) + "&time=" + (new Date()).getTime();
		updateSupportAsync("serviceBox", url);
	} else if (!keywordValue) {
		tmpKeyword = "";
		removeSupportBoxSuggest();
	}
	
	watchTimer = setTimeout(function() {catchKeyword(formObj)}, 200);
}

function directCatchKeyword(pageNum) {
	var formObj = document.getElementById("EcSearchForm");
	var urlHead = formObj.action.substring(0, formObj.action.lastIndexOf("/"));
	var url = urlHead + "/EcSearchKeywordSuggest.html?kw=" + encodeURI(formObj.kw.value) + "&pg=" + pageNum + "&time=" + (new Date()).getTime();
	updateSupportAsync("serviceBox", urlHead + "/EcSearchKeywordSuggest.html?kw=" + encodeURI(formObj.kw.value) + "&pg=" + pageNum + "&time=" + (new Date()).getTime());
}
function restartCatch() {
	if (watchTimer) {
		clearTimeout(watchTimer);
	}
	watchTimer = setTimeout(function() {catchKeyword()}, 200);
}
function clearIsMissing() {
	document.getElementById("isMissing").value = "";
}
function releaseSupport() {
	clearTimeout(watchTimer);
	if (!onSupportBox) {
		removeSupportBoxSuggest();
	}
}

function updateSupportAsync(target, url) {

	new Ajax.Updater('', url, 
		{
			asynchronous:true, 
			onComplete: function(response) {
				updateSupport(response.responseText);
			}
		});
}
function updateSupport(searchResult) {
	// change support-box status
	if (searchResult) {
		showSupportBoxSuggest(searchResult);
	} else {
		removeSupportBoxSuggest();
	}
}


//イベント振分け
function catchSupportEvent(evt){
	
	evt = (evt) ? evt : event;
	var charCode=(evt.charCode) ? evt.charCode : 
		((evt.which) ? evt.which : evt.keyCode);
	
	//履歴BOXが表示かどうか
	if(isSuggestBoxOn()){
		if (Number(charCode) == 38) {
			//KEY_DOWN（↑押下）時
			moveFocusTarget(-1);
		} else if (Number(charCode) == 40){
			//KEY_DOWN（↓押下）時
			moveFocusTarget(1);
		} else if (Number(charCode) == 13 || Number(charCode) == 3) {
			//ENTER押下時
			var focusObj = getFocusTarget();
			if (focusObj) {
				setSupportKeyword(focusObj);
				tmpKeyword = document.getElementById("EcSearchForm").kw.value;
				catchKeyword();
				return false;
			}
		}
	}
}

function getFocusTarget() {
	for (i = 0; i < 100; i++) {
		var supportKeywordObj = document.getElementById("supportKeyword_" + i);
		if (!supportKeywordObj) {
			break;
		}
		if (supportKeywordObj.className == "supportKeywordFocus") {
			return supportKeywordObj;
		}
	}
}
function setFocusTarget(focusTarget) {
	for (i = 0; i < 100; i++) {
		var supportKeywordObj = document.getElementById("supportKeyword_" + i);
		if (!supportKeywordObj) {
			break;
		}
		if (supportKeywordObj.className == "supportKeywordFocus") {
			supportKeywordObj.className = "supportKeyword";
			break;
		}
	}
	focusTarget.className = "supportKeywordFocus";
}


function moveFocusTarget(direction) {
	var focusSupportKeywordObj = getFocusTarget();
	if (!focusSupportKeywordObj && direction == 1) {
		focusSupportKeywordObj = document.getElementById("supportKeyword_0");
		focusSupportKeywordObj.className = "supportKeywordFocus";
		return;
	} else if (!focusSupportKeywordObj && direction == -1) {
		return;
	}
	
	var keywordIndex = Number(focusSupportKeywordObj.id.substring("supportKeyword_".length));
	
	var nextFocusTarget = document.getElementById("supportKeyword_" + (keywordIndex + direction));
	if (nextFocusTarget) {
		focusSupportKeywordObj.className = "supportKeyword";
		nextFocusTarget.className = "supportKeywordFocus";
	} else if (direction == -1) {
		focusSupportKeywordObj.className = "supportKeyword";
	}
}


//履歴ボックスが表示されているかどうか判定
function isSuggestBoxOn(){
	var boxObj = document.getElementById("serviceBox");
	if(boxObj.style.display == "none"){
		return false;
	} else {
		return true;
	}
}

//マウスオーバーイベント時の処理
function focusSupportKeyword(target){
	setFocusTarget(target);
}

//マウスアウト時のイベント処理(このイベントがないと履歴がひとつの時に消せないため)
function unFocusSupportKeyword(target){
	target.className = "supportKeyword";
}
/*****************************
 * 検索キーワード予測 END
 ****************************/


function resizeLoginPanelMenu() {
	var menuDisp = document.getElementById("mypage_menu").style.display;
	if (!menuDisp || menuDisp == "block") {
		document.getElementById("mypage_menu").style.display = "none";
		document.getElementById("resizeLoginPanelMenuButton").src = "/img/g_max.gif";
	} else {
		document.getElementById("mypage_menu").style.display = "block";
		document.getElementById("resizeLoginPanelMenuButton").src = "/img/g_min.gif";
	}
}

function setActiveStyleSheet(title) {
  var i, a, main;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
      a.disabled = true;
      if(a.getAttribute("title") == title) a.disabled = false;
    }
  }
}

function getActiveStyleSheet() {
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title") && !a.disabled) return a.getAttribute("title");
  }
  return null;
}

function getPreferredStyleSheet() {
  var i, a;
  for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
    if(a.getAttribute("rel").indexOf("style") != -1
       && a.getAttribute("rel").indexOf("alt") == -1
       && a.getAttribute("title")
       ) return a.getAttribute("title");
  }
  return null;
}

function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}

window.onunload = function(e) {
  var title = getActiveStyleSheet();
  createCookie("style", title, 365);
}

var cookie = readCookie("style");
var title = cookie ? cookie : getPreferredStyleSheet();
setActiveStyleSheet(title);


function subWin4(page){
	sub4=window.open(page,'sub_window4','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=500,height=500');
	window.sub4.focus();
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}


// Add to Bookmark
function addBookmark(title,url) { 
	if (window.sidebar) { 
		window.sidebar.addPanel(title, url,""); 
	} else if( document.all ) { 
		window.external.AddFavorite( url, title); 
	} else if( window.opera && window.print ) { 
		return true; 
	}
	return false;
}

// IE6用hover時背景画像ちらつき防止
try {
	document.execCommand('BackgroundImageCache', false, true);
} catch(e) {}

var xTimer;

// PullDown Manu on LeftMenu 
function setCategoryStyle() {
	$$('li.menuOff').each(function(element){
		Event.observe(element, 'mouseover', function(e){
			if(Prototype.Browser.IE==true || Prototype.Browser.WebKit==true) {
				window.clearTimeout(xTimer);
				hide();
			}
			Element.removeClassName(element, "menuOff");
			Element.addClassName(element, "menuOn");
		});
		Event.observe(element, 'mouseout', function(e){
			if(Prototype.Browser.IE==true || Prototype.Browser.WebKit==true) {
				xTimer = window.setTimeout("disp()", 100)
			}
			Element.removeClassName(element, "menuOn");
			Element.addClassName(element, "menuOff");
		});
	});
}
// IE,Webkit用<object>z-index対策
function hide(){
	var elems = document.getElementsByTagName("select");
	for (i = 0; i < elems.length; i++) {
		elems[i].style.visibility = "hidden";
	}
}

function disp(){
	window.clearTimeout(xTimer);
	var elems = document.getElementsByTagName("select");
	for (i = 0; i < elems.length; i++) {
		elems[i].style.visibility = "visible";
	}
}

window.onload = function(){
	setCategoryStyle();
}

/**
 * パネルをAjax非同期で情報を更新する。
 * @param targetDivId	挿入先のdivタグID
 */
function staticUpdateAsync(targetDivId) {
	document.write("<div id='static_panel_box' style='display:none;'></div>");
	if (document.getElementById(targetDivId)) {
		new Ajax.Updater(targetDivId,
			"/us/StaticPanel.html?returnUrl=" + document.URL + "&hoge=" + Math.random(), 
			{
				onComplete: function(request) { 
					// ログインパネルを表示
					if (document.getElementById('login_box')) {
						document.getElementById('login_box').innerHTML = document.getElementById('static_login_box').innerHTML;
					}
					// ログインパネルを表示
					if (document.getElementById('login_box_2')) {
						document.getElementById('login_box_2').innerHTML = document.getElementById('static_login_box_2').innerHTML;
						if (document.getElementById('login_box_2').innerHTML=="") {
							document.getElementById("login_box_2").style.display="none";
						}
					}
					//  ログインヘッドパネルを表示
					if (document.getElementById('login_msg_box')) {
						document.getElementById('login_msg_box').innerHTML = document.getElementById('static_login_msg_box').innerHTML;
					}
					// 最近見た商品パネルを表示
					if (document.getElementById('divRefer')) {
						document.getElementById('divRefer').innerHTML = document.getElementById('static_divRefer').innerHTML;
					}
				}
			}
		);
	}
}
// ウィンドウ表示時関数
staticUpdateAsync("static_panel_box");


//ユーザエージェントを表示
function writeUserAgent(targetDivId) {
	if (document.getElementById(targetDivId)) {
		document.getElementById(targetDivId).innerHTML = navigator.userAgent;
	}
}

function fadeOut(popId, opa, opacnt, timer) {
	document.getElementById(popId).style.filter = "alpha(opacity:"+opa+")";
	document.getElementById(popId).style.opacity = opa/100;
	opa -= opacnt;
	if(opa <= 0) {
		document.getElementById(popId).style.opacity = 0;
		return;
	}
	setTimeout("fadeOut('"+popId+"',"+opa+","+opacnt+","+timer+")",timer);
}

function fadeIn(popId, opa, opacnt, timer) {
	document.getElementById(popId).style.filter = "alpha(opacity:"+opa+")";
	document.getElementById(popId).style.opacity = opa/100;
	opa += opacnt;
	if(opa >= 100) {
		document.getElementById(popId).style.opacity = 1;
		return;
	}
	setTimeout("fadeIn('"+popId+"',"+opa+","+opacnt+","+timer+")",timer);
}

/***************************************************************************
 * Request
 ****************************************************************************/
function registViewrequest(requestAction, requesrParam, asyncFlg) {
	var xmlhttp = null;
	if(typeof ActiveXObject!="undefined"){ /* IE5, IE6 */
		try {
			xmlhttp=new ActiveXObject("Msxml2.XMLHTTP"); /* MSXML3 */
		} catch(e) {
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); /* MSXML2 */
		}
	}
	if(!xmlhttp && typeof XMLHttpRequest!="undefined"){
		xmlhttp=new XMLHttpRequest(); /* Firefox, Safari, IE7 */
	}
	if(!xmlhttp){
		return false;
	}
	if (requesrParam) {
		xmlhttp.open("GET",requestAction + requesrParam + "&time=" + new Date().getTime(),asyncFlg);
	} else {
		xmlhttp.open("GET",requestAction + "?time=" + new Date().getTime(),asyncFlg);
	}
	xmlhttp.send(null);
}


/***************************************************************************
 * Log Register
 ****************************************************************************/
function registPageview(busiCateCd) {
	if (!busiCateCd) {
		if (document.getElementById("hidBusiCateCd")) {
			busiCateCd = document.getElementById("hidBusiCateCd").value;
		} else {
			busiCateCd = "";
		}
	}
	registViewrequest("/us/WriteUuReferLog.html", "?busiCateCd=" + busiCateCd + "&referUrl=" + document.URL, true);
}
function registSpecialPageview(specialPageType) {
	if (location.hostname == "us.misumi-ec.com") {
		registViewrequest("/us/WriteSpecialPageReferLog.html", "?specialPageType=" + specialPageType + "&referUrl=" + document.URL, true);
	} else {
		document.write("<img src=\"http://us.misumi-ec.com/us/WriteSpecialPageReferLog.html?specialPageType=" + specialPageType + "&referUrl=" + document.URL + "&time=" + new Date().getTime() + "\" width=\"1\" height=\"1\" />");
	}
}
