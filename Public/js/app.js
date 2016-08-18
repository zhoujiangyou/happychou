/**
 * Created by admin on 2015/10/29.
 */

function clipWord(){
    $('.word-clip').each(function(index,el){
        var number =parseInt($(el).attr('data-length')) ;
        var html = $.trim($(el).html())  ;
        if(html.length > number){
            $(el).html(html.substr(0,number)+'...');
        }
    });
}
var returnUrl=null;
$(function(){

    //(function(){
    //    var el = $('.z-header .banner');
    //    if(!el) return;
    //    var clientHeight = window.innerHeight;
    //
    //    var innerHeight =clientHeight-140;
    //    el.css('height',innerHeight);
    //
    //    var item = el.find('.item')[0];
    //    var causul = el.find('.carousel a');
    //
    //    if(item){
    //        var cheight =  window.getComputedStyle(item).height;
    //    }
    //
    //    el.css('padding-top',(innerHeight-cheight)/2)
    //
    //    $(window).on('resize', function () {
    //        clientHeight = window.innerHeight;
    //        innerHeight =clientHeight-140;
    //        el.css('height',innerHeight);
    //    });
    //})()


    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    if (window.ActiveXObject){
        Sys.ie = ua.match(/msie ([\d.]+)/)[1]
        if (Sys.ie<=7){
            alert('浣犵洰鍓嶇殑IE鐗堟湰涓?'+Sys.ie+'鐗堟湰澶綆锛岃鍗囩骇锛?');location.href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie";
        }
    }

    clipWord();

    (function(){
        var menu = $('.z-navbar');
        if ($(document).scrollTop() >50) {
            menu.addClass('inv');
        }
        else {
            menu.removeClass('inv');
        }
        $(window).on('scroll', function () {
            if ($(document).scrollTop() >50) {
                menu.addClass('inv');
            }
            else {
                menu.removeClass('inv');
            }
        });
    })();



//    function checkSubmitEmail() {
//        if ($("#email").val() == "") {
//            $("#email").focus();
//            return '邮箱地址不能为空';
//        }
//        if (!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
//            $("#email").focus();
//            return '电子邮箱格式不正确';
//        }
//        return '';
//    }
//
//
//    function checkSubmitMobil() {
//        if ($("#mobile").val() == "") {
//            alert("手机号码不能为空！");
//            $("#mobile").focus();
//            return "手机号码不能为空！";
//        }
//
//        if (!$("#mobile").val().match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) {
//            alert("手机号码格式不正确！");
////$("#moileMsg").html("<font color='red'>手机号码格式不正确！请重新输入！</font>");
//            $("#mobile").focus();
//            return false;
//        }
//        return true;
//    }
});