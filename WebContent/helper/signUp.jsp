<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="EUC-KR" %>

<!DOCTYPE html>

<html>
<head>
    <title>ȸ������ ������</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script>
        var good_a = ["��ü"];
        var good_b = ["�Ѹ���", "�ֿ���", "������", "��õ��", "�Ѱ��", "���ڸ�", "�쵵��", "�ϵ���",
            "�̵���", "�ﵵ��", "��㵿", "���Ե�", "ȭ�ϵ�", "��絿", "������", "�ƶ�", "����",
            "����", "������", "�ܵ���", "��ȣ��", "���ε�"];
        var good_c = ["������", "������", "������", "�ȴ���", "ǥ����", "�ۻ굿", "���浿", "�߾ӵ�", "õ����",
            "ȿ����", "��õ��", "���ﵿ", "��ȫ��", "�����", "��õ��", "�߹���", "������"];

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
</head>
<body>


<h2>���� ȸ�� ����</h2>

<form method="POST" action="fileup" enctype="multipart/form-data">
    <input type="submit" value="�������ε�"/>
</form>

<form method="post" action="helper_add.do">
    Email (ID) : <input type="text" name="email" placeholder="Email�� �Է��ϼ��� ">
    <br/>
    password : <input type="password" name="pw">
    <br/>
    password Ȯ�� : <input type="password" name="pw">
    <br/>
    �̸� : <input type="text" name="helper_name">
    <br/>
    ��ȭ��ȣ : <input type="text" name="phoneNum" placeholder="'-'�� ������ ���ڸ� �Է��ϼ���.">
    <br/>
    ���� : <input type="radio" name="sex" value="female"> ����
    <input type="radio" name="sex" value="male"> ����
    <br/>
    ���¹�ȣ : <input type="text" name="bank" size="20" placeholder="�����">
    <input type="text" name="account" size="40" placeholder="'-'�� ������ ���ڸ� �Է��ϼ���.">
    <input type="text" name="accountname" size="10" placeholder="������">

    <br/>
    �ּ� : <input type="text" name="addr" size="50" placeholder="00�� 00�� ������ �����ּ���.">
    <input type="text" name="addr_detail" size="40" placeholder="������ �ּҸ� �Է����ּ���.">

    <br/> <br/>
    ��� �ٹ���1 :
    <select onchange="categoryChange1(this)" name="city1" id="city1" value="">
        <option> �� </option>
        <option value="a"> ��ü</option>
        <option value="b"> ���ֽ�</option>
        <option value="c"> ��������</option>
    </select>

    <select id="good1" name="dong1">
        <option> ��, ��, �� </option>
    </select>


    <br/>
    ��� �ٹ���2 :
    <select onchange="categoryChange2(this)" name="city2" id="city2" value="">
        <option> �� </option>
        <option value="a"> ��ü</option>
        <option value="b"> ���ֽ�</option>
        <option value="c"> ��������</option>
    </select>

    <select id="good2" name="dong2">
        <option> ��, ��, �� </option>
    </select>


    <br/>
    ��� �ٹ���3 :
    <select onchange="categoryChange3(this)" name="city3" id="city3" value="">
        <option> �� </option>
        <option value="a"> ��ü</option>
        <option value="b"> ���ֽ�</option>
        <option value="c"> ��������</option>
    </select>


    <select id="good3" name = "dong3">
        <option> ��, ��, �� </option>
    </select>
    <br/>
    <br/>

    �ϰ���� ��
    <br/>
    <textarea name="message" rows="5" cols="40" placeholder="�ڽſ� ���� �Ѹ���� ǥ�����ּ���." maxlength="200">
    </textarea>
    <input type="submit"/>
    <!--
    <div class="container">
        <form>
            <div class="form-group">
                <label for="comment">�ϰ� ���� ��:</label>
                <textarea class="form-control" rows="5" col="40" name="messege" id="comment"></textarea>
            </div>
        </form>
    </div>
    -->

</form>
<br/><br/>
</body>
</html>
