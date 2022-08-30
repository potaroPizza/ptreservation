$(function(){
    //아이디 중복검사
    const $chkIdDup = document.getElementById('chkIdDupBtn')

    function onclickChkIdDupBtn () {
        window.open("chkIdDup?id=" + document.getElementById("id")
            .value, "", "width=500, height=300");
    }

    $chkIdDup.onclick = onclickChkIdDupBtn;

    //아이디 중복검사 완료 후, 아이디 변경시, 중복확인 => 'N' 처리
    $("#id").keyup(function(){
        if($("#isChkId").val() === "Y"){
            $("#isChkId").val("N");
        }
    });

    // 회원가입 시, 유효성 검사
    $("form[name=joinFrm]").submit(function(event1){
        if($.trim($("#name").val()) === "") {
            console.log("1");
            alert('이름을 "입력"해주세요.')
            $("#name").focus();
            event1.preventDefault();
        }else if(!validate_name($("#name").val())){
            console.log("2");
            alert("이름 작성 규칙에 맞춰서 입력해주세요");
            $("#name").focus();
            event1.preventDefault();
        }else if($.trim($("#id").val()) === ""){
            console.log("3");
            alert("아이디를 입력해주세요.")
            $("#id").focus();
            event1.preventDefault();
        }else if($("#isChkId").val() === "N"){
            alert("아이디를 중복확인을 해주세요.")
            $("#isChkId").focus();
            event1.preventDefault();
        }else if($.trim($("#pw").val()) === ""){
            alert("비밀번호를 입력해주세요.");
            $("#pw").focus();
            event1.preventDefault();
        }else if(!validate_pw($("#pw").val())){
            alert("비밀번호 작성 규칙에 맞춰서 입력해주세요.");
            $("#pw").focus();
            event1.preventDefault();
        }else if($("#isChkPw").val() === "N"){
            alert("비밀번호를 일치시켜주세요.");
            $("#pwChk").focus();
            event1.preventDefault();
        }else if($.trim($("#hp").val()) === ""){
            alert("전화번호를 입력해주세요.");
            $("#hp").focus();
            event1.preventDefault();
        }else if(!validate_hp($("#hp").val())){
            alert("휴대폰번호 작성 규칙에 맞춰서 입력해주세요.");
            $("#hp").focus();
            event1.preventDefault();
        }

        if($.trim($("#name").val()) === "") {
            console.log("1");
            alert('이름을 "입력"해주세요.')
            $("#name").focus();
        }
    });
    
    // 정규식 검사
    // NAME
    $("#name").on("keyup", function(){
        if(!validate_name($("#name").val())){
            $(".error-msg").eq(0)
                .text("10자 이내의 한글로 작성해주세요.")
                .css("color", "red");
        } else {
            $(".error-msg").eq(0)
                .text("Good")
                .css("color", "green");
        }
    });

    // ID
    $("#id").keyup(function(){
        if(!validate_id($("#id").val())){
            $(".error-msg").eq(1)
                .text("알파벳으로 시작하는 4~20자 이내의 영어 혹은 영어+숫자로 작성해주세요.")
                .css("color", "red");
            $("#chkIdDupBtn").prop("disabled", true);
        }else{
            $(".error-msg").eq(1)
                .text("중복확인 해주세요.")
                .css("color", "black");
            $("#chkIdDupBtn").prop("disabled", false);
        }
    });

    // PW
    $("#pw").keyup(function(){
        if(!validate_pw($("#pw").val())){
            $(".error-msg:eq(2)")
                .text("8~16자리, 알파벳+숫자+특수문자의 형태로 작성해주세요")
                .css("color", "red");
        }else{
            $(".error-msg:eq(2)")
                .text("Good")
                .css("color", "green");
        }
    });

    // PW Check
    $("#pwChk").keyup(function(){
        if($("#pw").val() !== $("#pwChk").val()){
            $(".error-msg:eq(3)")
                .text("비밀번호가 일치하지 않습니다.")
                .css("color", "red");
            $("#isChkPw").val("N");
        }else{
            $(".error-msg:eq(3)")
                .text("비밀번호가 일치합니다.")
                .css("color", "green");
            $("#isChkPw").val("Y");
        }
    });

    // HP
    $("#hp").keyup(function(){
        if(!validate_hp($("#hp").val())){
            $(".error-msg:eq(4)")
                .html("-(하이픈)을 뺀 휴대폰번호 10~11자리를 입력해주세요.")
                .css("color", "red");
        }else{
            $(".error-msg:eq(4)")
                .html("Good")
                .css("color", "green");
        }
    });
});

// 정규식
function validate_name(name){
    let pattern = new RegExp(/^[가-힣]{1,10}$/);
    return pattern.test(name);
}
function validate_id(id){
    let pattern = new RegExp(/^[a-zA-Z][0-9a-zA-Z]{3,19}$/);
    return pattern.test(id);
}
function validate_pw(pw){
    let pattern = new RegExp(/^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
    return pattern.test(pw);
}
function validate_hp(hp){
    let pattern = new RegExp(/^([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})$/);
    return pattern.test(hp); //정규식과 일치하면 true
}

/** 컨텍스트패스 구하는 함수 */
// function getContexPath() {
//     let hostIndex = location.href.indexOf(location.host) + location.host.length;
//     let contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
//     return contextPath;
// }