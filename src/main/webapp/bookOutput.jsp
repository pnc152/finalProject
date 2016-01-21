<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
   <title>성관이 페이지 출력 폼 </title>
   
   <script type="text/javascript">
   var stripe = function() {
      var tables = document.getElementsByTagName("table");   

      for(var x=0;x!=tables.length;x++){
         var table = tables[x];
         if (! table) { return; }
         
         var tbodies = table.getElementsByTagName("tbody");
         
         for (var h = 0; h < tbodies.length; h++) {
            var even = true;
            var trs = tbodies[h].getElementsByTagName("tr");
            
            for (var i = 0; i < trs.length; i++) {
               trs[i].onmouseover=function(){
                  this.className += " ruled"; return false
               }
               trs[i].onmouseout=function(){
                  this.className = this.className.replace("ruled", ""); return false
               }
               
               if(even)
                  trs[i].className += " even";
               
               even = !even;
            }
         }
      }
   }

   window.onload = stripe;
   </script>
      <!-- 체크박스 전체선택 function -->
      <script>
         var checkflag = "false";
         function check(field) {
            if (checkflag == "false") {
               for (i = 0; i < field.length; i++) {
                  field[i].checked = true;
               }
               checkflag = "true";
               return "전체 선택 해제";
            } else {
               for (i = 0; i < field.length; i++) {
                  field[i].checked = false;
               }
               checkflag = "false";
               return "전체 선택";
            }
         }
      </script>
<!-- 여기까징 -->


<style type="text/css">
   table{
      border: 1px solid #666;
   }
   tr td{
      font-family: "lucida grande", verdana, sans-serif;
      font-size: 8pt;
      padding: 3px 8px;
      background: #fff;
   }
   thead td{
      color: #fff;
      background-color: #FF7D1E;
      font-weight: bold;
      border-bottom: 1px solid #999;
   }
   tbody td{
         border-left: 1px solid #D9D9D9;
   }
   tbody tr.even td{
      background: #eee;
   }
   tbody tr.selected td{
      background: #2ba6cb;
      color: #eeeeee;
      font-weight: bold;
      border-left: 1px solid #346DBE;
      border-bottom: 1px solid #7DAAEA;
   }
   tbody tr.ruled td{
      color: #000;
      background-color: #C6E3FF; 
      font-weight: bold;
      border-color: #3292FC;
   }
   
   /* Opera fix */
   head:first-child+body tr.ruled td{
      background-color: #C6E3FF; 
   }
   </style>
</head>

<body>
<form name="form">
   <table cellspacing="0">
      <thead>
      
      <tr>
         <td>선택</td>
         <td>등록번호</td>
         <td>제목</td>
         <td>출판사</td>
         <td>저자</td>
         <td>ISBN</td>
         <td>입고날짜</td>
         <td>삭제버튼자리</td>
      </tr>
      </thead>
      <tbody>
      <tr class="selected">
         <td><input type="checkbox" id="chktest" name="checkbox" value="" ></input></td>
         <td>등록번호</td>
         <td>스프링</td>
         <td>가메출판사</td>
         <td>닐 스미스</td>
         <td>978-89-8078-231-4</td>
         <td>2016-01-02</td>
         <td><input type="button" name="btnDel" id="btnDel" value="삭제"></input></td>
      </tr>
      
      <tr class="selected">
         <td><input type="checkbox" id="chktest" name="checkbox" value="" ></td>
         <td>등록번호</td>
         <td>자바</td>
         <td>야매출판사</td>
         <td>윌 스미스</td>
         <td>111-11-1111-111-1</td>
         <td>2016-01-03</td>
         <td><input type="button" name="btnDel" id="btnDel" value="삭제"></input></td>
      </tr>
      <input type="button" name="button" value="checkAll" onclick="this.value=check(this.form.checkbox)"/>   
      </tbody>
   </table>
   
   
   </form>
</body>
</html>