$(function(){
    // 아이디 정규식 검사
    $("#chkIdDup").keyup(function(){
        $("#result")
            .html("아이디를 입력 후 중복검사 해주세요.")
            .css("color", "black");
        $("#useIdBtn").css("display", "none");

        if(!validate_id($("#chkIdDup").val())){
            $(".error-msg").eq(0)
                .html("알파벳으로 시작하는 4~20자 이내의 영어 혹은 영어+숫자로<br/> 작성해주세요.")
                .css("color", "red");
            $("#chkIdDupBtn").prop("disabled", true);
        } else {
            $(".error-msg").eq(0)
                .text("Good")
                .css("color", "green");
            $("#chkIdDupBtn").prop("disabled", false);
            $("#result")
                .html("중복검사 버튼을 눌러주세요.");
        }
    });
    
    // '중복확인' 버튼
    $("#chkIdDupBtn").click(function(){
        let id = document.getElementById("chkIdDup").value;

        if($.trim($("#chkIdDup").val()) == ""){
            $("#result")
                .html("중복검사할 아이디를 입력하세요.")
                .css("color", "red");
            $("#useIdBtn").css("display", "none");

            return false;
        }

        chkIdDup(id);
    });

    // Enter쳐도 동작하게 만들기
    $("#chkIdDup").keypress(function(e){
        if(e.keyCode == 13){
            $("#chkIdDupBtn").click();
        }
    });

    // '사용하기' 버튼
    $("#useIdBtn").click(function(){
        $(opener.document)
            .find("#id")
            .val(document.getElementById("chkIdDup").value);
        window.opener.document.getElementById("isChkId").value = "Y";
        $(opener.document)
            .find(".error-msg:eq(1)")
            .text("중복확인 완료!")
            .css("color", "green");

        self.close();
    });

    const chkIdDup = (id) => {
        $.ajax({
            url : "/user/chkIdDup",
            type : "post",
            //data : "id="+id,
            data : {id:id},
            dataType : "json",
            success : function(res){
                if(res === 1){
                    $("#result")
                        .html("이미 존재하는 아이디입니다.<br/> 다른 아이디를 입력해보세요.")
                        .css("color", "red");
                    $("#useIdBtn").css("display", "none");
                } else if(res === 0){
                    $("#result")
                        .html("사용 가능한 아이디입니다.<br/> 사용하기 버튼을 눌러 창을 닫아주세요.")
                        .css("color", "green");
                    $("#useIdBtn").css("display", "inline");
                }
            },error : function(xhr, status, error){
                alert("error! : " + error)
            }
        });
    };
});

// 정규식
// 아이디
function validate_id(id){
    let pattern = new RegExp(/^[a-zA-Z][0-9a-zA-Z]{3,19}$/);
    return pattern.test(id);
}