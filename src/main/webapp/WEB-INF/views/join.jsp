<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Join</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script>
    $(function(){
        // 유효성 검사
        $("form[name=joinFrm]").submit(function(){
            alert($("#dupChk").val())
            console.log();
            if($.trim($("#name").val()) === ""){
                alert("이름을 입력해주세요.")
                $("#name").focus();
                event.preventDefault();
            }else if(!validate_name($("#name").val())){
                alert("한글만 10자 이내로 입력해주세요");
                $("#name").focus();
                event.preventDefault();
            }else if($.trim($("#id").val()) == ""){
                alert("아이디를 입력해주세요.")
                $("#id").focus();
                event.preventDefault();
            }else if($("#dupChk").val() === "N"){
                alert("아이디를 중복확인을 해주세요.")
                $("#dupChk").focus();
                event.preventDefault();
            }else if($.trim($("#pw").val()) === ""){
                alert("비밀번호를 입력해주세요.");
                $("#pw").focus();
                event.preventDefault();
            }
        });
    });

    // 정규식
    function validate_name(name){
        var pattern = new RegExp(/^[가-힣]{1,10}$/);
        return pattern.test(name);
    }
    function validate_pwd(pwd){
        var pattern = new RegExp(/^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
        return pattern.test(pwd);
    }
    function validate_accNum(accNum){
        var pattern = new RegExp(/^[0-9]*$/g);
        return pattern.test(accNum);
    }
    function validate_hp(hp){
        var pattern = new RegExp(/^([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})$/);
        return pattern.test(hp); //정규식과 일치하면 true
    }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>
<form method="post" name="joinFrm"
    action="<c:url value='/user/join'/>">
    이름 : <input type="text" name="name" id="name"/><br/>
    ID &nbsp : <input type="text" name="id" id="id"/>
    <input type="button" value="중복확인" id="dupChkBtn"/>
    <input type="hidden" name="dupChk" id="dupChk" value="N"/>
    <br/>
    PW : <input type="password" name="pw" id="pw"/><br/>
    PW 확인 : <input type="password" name="chkPw" id="chkPw"/><br/>
    hp : <input type="password" name="hp" id="hp"/><br/>
    계정구분 :
        <select name="usersCategory">
            <option value="100">일반회원</option>
            <option value="200">트레이너</option>
        </select><br/><br/>
    <input type="submit" value="회원가입"/>
    <input type="button" value="취소" id="cancelBtn"/>
</form>

</body>
</html>
