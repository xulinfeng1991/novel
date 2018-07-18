

window.domain = "http://localhost:8080"

/*导入头部、尾部、一级导航、二级导航*/
function initPage(){
    $("header").load("header.html");
    $("footer").load("footer.html");
    $(".top-nav").load("top-nav.html");
    $(".sub-nav").load("sub-nav.html");
}

function format(value){
    if(value==undefined || value==null){
        value = '';
    }
    return value;
}