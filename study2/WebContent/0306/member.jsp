<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
    font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    box-sizing: border-box;	
}
a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}
.btn {
    color:#333333;
    font-weight:500;
    border:1px solid #cccccc;
    background-color:#fff;
    text-align:center;
    cursor:cursor;
    padding:3px 10px 5px;
    border-radius:4px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333333;
}
.boxTF {
    border:1px solid #999999;
    padding:4px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
}
.selectField {
    border:1px solid #999999;
    padding:2px 5px 6px;
    border-radius:4px;
    font-size: 12px;
}

input:focus, textarea:focus {
	outline: none;
}

.container{
    width: 800px;
    margin: 30px auto;
}

.body-title {
	width:100%;
	height:45px;
	line-height:45px;
	text-align:left;
	font-weight: bold;
	font-size:15px;
}

.body-container{
	width:100%;
	min-height: 500px;
}

.member-form{
}

.member-form .input-session{
   margin-bottom: 15px;
}


.member-form .input-title{
	font-size:13px;
    color: #212121;
    line-height: 180%;
}

.member-form .input-title{
	font-size:14px;
    color: #212121;
}

.member-form .input-box{
	border: 1px solid #A6A6A6;
	padding: 10px 10px 10px 10px;
	clear: both;
}

.member-form .input-box p{
	line-height: 200%;
}

.member-form .input-box label{
    display:inline-block;
	width: 110px;
}

.member-form .input-box span{
	display: inline-block;
}

.member-form .member-confirm{
	line-height: 150%;
	text-align: center;
}
</style>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(function(){
	$(".schoolAddBtn").click(function(){
		//var p = $(this).parent().parent().find("div:first-child :first").html();
		var p = $(this).parent().parent().find("div:first-child").children("p").html();
		$(this).parent().parent().find("div:first").append("<p>" + p + "</p");
	});
	
	$("body").on("click", ".schoolRemoveBtn", function(){
		// closest("태그") : 가장 가까운 부모 태그
		if($(this).closest("div").find("p").length <= 1) {
			return;
		}
		
		$(this).parent().parent().remove();
	});
});
</script>

</head>
<body>

<div class="container">
    <div class="body-title">
        <h3><span>|</span> 회원가입 </h3>
    </div>

    <div class="body-container">
        <form>
            <div class="member-form">
            
                <div class="input-session basic-input">
                    <div class="input-title"><h4>기본 입력 사항</h4></div>
                    <div class="input-box">
                        <p>
                            <label>아이디 : </label>
                            <input type="text" name="userId" class="boxTF" style="width: 82%;"
                                       placeholder="아이디 입력">
                        </p> 
		
                        <p>
                            <label>패스워드 :</label>
                            <input type="password" name="userPwd" class="boxTF" style="width: 82%;"
                                       placeholder="패스워드 입력">
                        </p> 
		
                        <p>
                            <label>이름 :</label>
                            <input type="password" name="userName" class="boxTF" style="width: 82%;"
                                       placeholder="이름 입력">
                        </p> 
                    </div>
                </div>
         
                <div class="input-session education-input">
                    <div class="input-title"><h4>학력 사항</h4></div>
                    <div class="input-box">
                        <div>
                            <p>
                                <span>
                                    <input type="text" name="schoolName" class="boxTF"
                                       placeholder="학교명을 입력하세요">
                                 </span>
                                 <span>
                                    <input type="text" name="schoolDate1" class="boxTF"
                                       placeholder="입학날짜를 입력하세요"> ~ 
                                    <input type="text" name="schoolDate2" class="boxTF"
                                       placeholder="졸업날짜를 입력하세요">
                                 </span>
                                 <span style="float: right;">
                                    <button type="button" class="btn schoolRemoveBtn" style="width: 40px;">X</button>
                                 </span>
                            </p>
                        </div>
                        <div style="text-align: center; margin-top: 10px;">
                             <button type="button" class="btn schoolAddBtn">추가</button>
                        </div>
                    </div>
                </div>
         
                <div class="input-session license-input">
                    <div class="input-title"><h4>자격증</h4></div>
                    <div class="input-box">
                        <div>
                            <p>
                                <span>
                                    <input type="text" name="licenseName" class="boxTF"
                                       placeholder="자격증명을 입력하세요">
                                 </span>
                                 <span>
                                    <input type="text" name="licenseDate" class="boxTF"
                                       placeholder="자격증취득날짜를 입력하세요">
                                 </span>
                                 <span style="float: right;">
                                    <button type="button" class="btn licenseRemoveBtn" style="width: 40px;">X</button>
                                 </span>
                            </p>
                        </div>
                        <div style="text-align: center; margin-top: 10px;">
                             <button type="button" class="btn licenseAddBtn">추가</button>
                        </div>
                    </div>
                </div>

                <div class="member-confirm">
				    <button type="button" class="btn"> 회원가입 </button>
				    <button type="reset" class="btn"> 다시입력 </button>
				    <button type="button" class="btn"> 가입취소 </button>
                </div>

            </div>
        </form>
    </div>  
</div>


</body>
</html>