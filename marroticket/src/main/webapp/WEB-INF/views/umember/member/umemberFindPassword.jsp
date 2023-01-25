<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    $(document).ready(function() {
        $("#umemberFindPassword").on("click", function() {
            //json
            var uId =  $("#uId");
            var uEmail =  $("#uEmail");
            var uIdVal = uId.val();
            var uEmailVal = uEmail.val();
            var jsonObject = { uId : uIdVal , uEmail:uEmailVal };
            var jsonStg = JSON.stringify(jsonObject);
            console.log(jsonStg);
            //ajax
            $.ajax({
                type : "post",
                url : "/umember/findPassword",
                data : jsonStg,
                contentType : "application/json; charset=utf-8",
                success : function(result){
                    switch (result) {
                        case 'none':
                            //아이디 또는 이메일을 하나 이상 입력하지 않았을 떄
                            alert("정보를 입력하세요.");
                            break;
                        case 'fail':
                            //입력한 아이디와 이메일에 일치하는 아이디가 없을 때
                            alert("비밀버호 찾기 실패 \n입력하신 정보와 일치하는 비밀번호가 없습니다.");
                            break;
                        case 'novalid':
                            //입력한 아이디와 이메일이 유효하지 않을 때
                            alert("알맞은 형식에 맞게 정보를 입력해주세요");
                            break;
                        default :
                            //비밀번호 찾기 성공
                            console.log('회원의 비밀번호 : ' + result);
                            alert("비밀번호 찾기 성공 \n비밀번호는 "+result+"입니다.");
                            break;
                    }
                }
            });
        });
    });
</script>
<p>비밀번호 찾기</p>
<div>
    <table>
        <tr>
            <td><label for="uId">아이디</label></td>
        </tr>
        <tr>
            <td><input type='text' name='uId' id='uId'/></td>
        </tr>
        <tr>
            <td><label for="uEmail">이메일</label></td>
        </tr>
        <tr>
            <td><input type='text' name='uEmail' id='uEmail' />
        </tr>
        <tr>
            <td align='right'><input type='button' id='umemberFindPassword' value='찾기'></td>
        </tr>
    </table>
</div>