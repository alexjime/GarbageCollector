<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
%>
<%
    String ctxPath = request.getContextPath();
%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="<%=ctxPath %>/assets/css/index.css">

    <title>당신의 쓰레기는 안녕하수깡?</title>
    <link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">

    <script>


        // When the user scrolls the page, execute myFunction
        window.onscroll = function () {
            myFunction()
        };

        function myFunction() {
            var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            var scrolled = (winScroll / height) * 100;
            document.getElementById("myBar").style.width = scrolled + "%";
        }
   \
        var good_a = ["전체"];
        var good_b = ["한림읍", "애월읍", "구좌읍", "조천읍", "한경면", "추자면", "우도면", "일도동",
            "이도동", "삼도동", "용담동", "건입동", "화북동", "삼양동", "봉개동", "아라동", "오라동",
            "연동", "노형동", "외도동", "이호동", "도두동"];
        var good_c = ["대정읍", "남원읍", "성산읍", "안덕면", "표선면", "송산동", "정방동", "중앙동", "천지동",
            "효돈동", "영천동", "동흥동", "서홍동", "대륜동", "대천동", "중문동", "예래동"];

        function categoryChange1(e) {

            var target1 = document.getElementById("good1");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target1.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target1.appendChild(opt);
            }
        }

        function categoryChange2(e) {
            var target2 = document.getElementById("good2");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target2.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target2.appendChild(opt);
            }
        }

        function categoryChange3(e) {

            var target3 = document.getElementById("good3");

            if (e.value == "a") var d = good_a;
            else if (e.value == "b") var d = good_b;
            else if (e.value == "c") var d = good_c;

            target3.options.length = 0;

            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target3.appendChild(opt);
            }
        }
    </script>

    <style>
        @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
        @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
        @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
        @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

        body {
            font-family: 'Jeju Myeongjo', serif;
            font-size: 12pt;
        }
        input {
            border: 1px solid #73AD21;
            padding: 3px;
        }

        * { box-sizing: border-box }

        .container {
            padding: 15px;
        }

        .button {
            background-color: lightcoral; /* Green */
            border: none;
            color: white;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button4 {
            border-radius: 12px;
        }

        .button:hover {
            opacity: 1;
        }

    </style>
</head>
<body>
<%@include file="/header.jsp" %>

<form action="helper_add.do">
    <div class="container form-group">
        <h2> 대행 회원 가입</h2>
        <p> 회원 가입을 위해 정보를 입력해 주세요. </p>
        <hr>
        <br/>

        <div class="row">
        <div class="col-xs-3" >
            <form method="POST" action="fileup" enctype="multipart/form-data">
                <input type="submit" value="사진업로드"/>
            </form>
        </div>

        <div class="col-xs-9 w3-padding-24 w3-margin-3" >
            Email (ID) : <input type="text" name="email" placeholder="Email을 입력하세요 " required>
            <br/>
            password : <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required>
            <br/>
            password 확인 : <input type="password" name="pw" placeholder="비밀번호를 확인하세요" required>
            <br/>
            이름 : <input type="text" name="helper_name" required>
            <br/>
            전화번호 : <input type="text" name="phoneNum" placeholder="'-'를 제외한 숫자만 입력하세요." required>
            <br/>
            성별 : <input type="radio" name="sex" value="female"> 여성
            <input type="radio" name="sex" value="male"> 남성
            <br/>
            계좌번호 : <input type="text" name="bank" size="20" placeholder="은행명" required>
            <input type="text" name="accountname" size="10" placeholder="예금주" required> <br/>
            <input type="text" name="account" size="40" placeholder="'-'를 제외한 숫자만 입력하세요." required>


            <br/> <br/>
            희망 근무지1 :
            <select onchange="categoryChange1(this)" name="city1" id="city1" value="" required>
                <option> 시</option>
                <option value="a"> 전체</option>
                <option value="b"> 제주시</option>
                <option value="c"> 서귀포시</option>
            </select>

            <select id="good1" name="dong1" required>
                <option> 읍, 면, 동</option>
            </select>


            <br/>
            희망 근무지2 :
            <select onchange="categoryChange2(this)" name="city2" id="city2" value="">
                <option> 시</option>
                <option value="a"> 전체</option>
                <option value="b"> 제주시</option>
                <option value="c"> 서귀포시</option>
            </select>

            <select id="good2" name="dong2">
                <option> 읍, 면, 동</option>
            </select>


            <br/>
            희망 근무지3 :
            <select onchange="categoryChange3(this)" name="city3" id="city3" value="">
                <option> 시</option>
                <option value="a"> 전체</option>
                <option value="b"> 제주시</option>
                <option value="c"> 서귀포시</option>
            </select>

            <select id="good3" name="dong3">
                <option> 읍, 면, 동</option>
            </select>
            <br/>

            하고싶은 말
            <br/>
            <textarea name="message" rows="5" cols="50" placeholder="자신에 대해 한마디로 표현해주세요." maxlength="100">
            </textarea>
        </div>
        </div>

        <div class="clearfix row">
            <div class="col-xs-5"></div>
            <div class="col-xs-3">
                <button type="submit" class="button button4">가입하기</button>
            </div>
            <div class="col-xs-3">
            </div>
        </div>
    </div>
</form>

<%@include file="/footer.jsp" %>
<%@include file="/script.jsp" %>

</body>
</html>