$(document).ready(function() {
    title();
    $(function() {
        $('#fullpage').fullpage({
            verticalCentered: false,
            anchors: ['part1', 'part2', 'part3', 'part4', 'part5', 'part6'],
            navigation: true,
            navigationTooltips: ['首页', '关于我', '专业技能', '我的经历', '我的作品', '联系我'],
            paddingTop: '80px',
            fixedElements: '.top_bar',
            afterLoad: function(anchorLink, index) {
                switch (index) {
                    case 1:
                    $('.hblock').empty();
                        $("body").addClass("home_zoom");
                        $("#pahp").addClass("home_move");
                        setTimeout(function() {
                            $("#pahp").find("h3").animate({
                                "opacity": "1"
                            }, 1000)
                        }, 1500);
                        setTimeout(function() {
                            $("#pahp").find(".tiao").addClass("h3aft");
                        }, 2300);
                        setTimeout(function() {
                            var aaa = $("#pahp").find("p");
                            aaa.each(function(index) {
                                aaa.eq(0).animate({
                                    opacity: "1"
                                }, 500, function() {
                                    aaa.eq(1).animate({
                                        opacity: "1"
                                    }, 500, function() {
                                        aaa.eq(2).animate({
                                            opacity: "1"
                                        }, 500, function() {
                                            aaa.eq(3).animate({
                                                opacity: "1"
                                            }, 500, function() {
                                                $("#side").animate({
                                                    opacity: "1"
                                                }, 500)
                                            })
                                        })
                                    })
                                });
                            })
                        }, 3000);
                        break;
                    case 2:
                        $('.hblock').empty();
                        $('#effect2').find('.hblock').append('<div class="hongxian"</div><h3>· About Me ·</h3>');
                        $("#effect2").find(".hongxian").addClass("h3aft");
                        $("#effect2").find(".content").addClass("wobble");
                        setTimeout(function() {
                            $("#effect2").find("h3").slideDown(400, function() {
                                var bbb = $(".content").find("p");
                                bbb.eq(0).animate({
                                    top: "3px"
                                }, 700, function() {
                                    bbb.eq(1).animate({
                                        top: "35px"
                                    }, 700, function() {
                                        bbb.eq(2).animate({
                                            top: "70px"
                                        }, 700, function() {
                                            bbb.eq(3).animate({
                                                top: "105px"
                                            }, 700)
                                        })
                                    })
                                })
                            })
                        }, 1100)
                        break;
                    case 3:
                        $('.hblock').empty();
                        $('#effect3').find('.hblock').append('<div class="hongxian"</div><h3>· SKILL ·</h3>');
                        $("#effect3").find(".hongxian").addClass("h3aft");
                        setTimeout(function() {
                            $("#effect3").find("h3").slideDown(400, function() {
                                $("#effect3").find("li").addClass("l_to_r");
                            })
                        }, 1100);
                        break;
                    case 4:
                        $('.hblock').empty();
                        $('#effect4').find('.hblock').append('<div class="hongxian"</div><h3>· Experience ·</h3>');
                        $("#effect4").find(".hongxian").addClass("h3aft");
                        $("#effect4").find(".banner").addClass("b_to_t");
                        $("#effect4").find(".odiv").addClass("b_to_t");
                        setTimeout(function() {
                            $("#effect4").find("h3").slideDown(400)
                        }, 1100);
                        clickph();
                        atz();
                        break;
                    case 5:
                        $('.hblock').empty();
                        $('#effect5').find('.hblock').append('<div class="hongxian"</div><h3>· DEMO ·</h3>');
                        $("#effect5").find(".hongxian").addClass("h3aft");
                        setTimeout(function() {
                            $("#effect5").find("h3").slideDown(400)
                        }, 1100);
                        var i = -1;
                        $("#effect5").find("li").each(function() {
                            var This = $(this);
                            if (!This.hasClass("b_to_t")) {
                                i++;
                                setTimeout(function() {
                                    This.addClass("b_to_t");
                                }, 200 * i);
                            }
                        })
                        setTimeout(function() {
                            $("#effect5").find("p").addClass("b_to_t")
                        }, 1100);
                        break;
                    case 6:
                        $('.hblock').empty();
                        $('#effect6').find('.hblock').append('<div class="hongxian"</div><h3>· CONTACE ME ·</h3>');
                        $("#effect6").find(".hongxian").addClass("h3aft");
                        $("#effect6").find("h5").addClass("b_to_t");
                        setTimeout(function() {
                            $("#effect6").find("span").each(function(index) {
                                var ccc = $("#effect6").find("span");
                                ccc.eq(0).animate({
                                    opacity: "1"
                                }, 500, function() {
                                    ccc.eq(1).animate({
                                        opacity: "1"
                                    }, 500, function() {
                                        ccc.eq(2).animate({
                                            opacity: "1"
                                        }, 500, function() {
                                            ccc.eq(3).animate({
                                                opacity: "1"
                                            }, 500)
                                        })
                                    })
                                })
                            })
                        }, 500)
                        setTimeout(function() {
                            $("#effect6").find("h3").slideDown(400)
                        }, 1100);
                    default:
                        break;
                }
            },
        })
    })
})


//文字变换
function title() {
    var title = $('#title')
    var t1 = title.find('h3')
    var t2 = title.find('p')
    title.hover(function() {
        t1.html('求职');
        t2.html('前端工程师');
    }, function() {
        t1.html('郑延虎');
        t2.html('个人简历');
    });
}

//轮播图1
function clickph() {
    var box = $("#banner_box");
    var iNow = 0;
    $("#previous").bind('click', function() {
        if (iNow == 0) {
            box.stop().animate({
                left: "150px"
            }, 200, function() {
                box.animate({
                    left: "0"
                }, 200);
            });
            iNow = 0;
        } else {
            box.animate({
                left: "+=1000px"
            }, 500);
            iNow--;
        }
    });
    $("#next").bind('click', function() {
        if (iNow == 2) {
            box.stop().animate({
                left: "-2150px"
            }, 200, function() {
                box.animate({
                    left: "-2000px"
                }, 200);
            });
            iNow = 2;
        } else {
            box.animate({
                left: "-=1000px"
            }, 500);
            iNow++;
        }
    });
}

//轮播图2
function atz() {
    var oa = $(".odiv").find("a");
    var box = $("#banner_box");
    oa.each(function(index) {
        $(this).bind('click', function() {
            if (index == 0) {
                box.animate({
                    left: "0"
                }, 500);
            } else if (index == 1) {
                box.animate({
                    left: "-1000px"
                }, 500);
            } else {
                box.animate({
                    left: "-2000px"
                }, 500);
            }
        })
    })
}
