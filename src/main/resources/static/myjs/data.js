
$(document).ready(function () {
    $(".top-nav").load("top-nav.html",function() {
        $("#top-nav-data").attr("class", "selected");
    });
    loadMetro();
});

function loadMetro(){
    var msg = ["nav-block-orange","nav-block-blue","nav-block-yellow","nav-block-red","nav-block-green"];

    $.get(window.domain+"/data/list",function(data){
        var array = data.result;
        var html = '';
        for(var i=0;i<array.length;i++){
            html+='<div class="metro-nav-block '+msg[Math.floor(Math.random() * msg.length)];
            html+='" onclick="loadTable('+array[i].id+',this)">';
            html+='<a href="javascript:void(0)">';
            html+='<div class="fs1" aria-hidden="true" data-icon="&#xe0b8;"></div>';
            html+='<div class="brand">'+array[i].dataName+'</div>';
            html+='</a></div>';
        }
        $(".metro-nav").html(html);
        $(".metro-nav-block:first").addClass("current");
    });
}

//点击某个资料
function loadTable(id,dom){
    $(".metro-nav-block").removeClass("current");
    $(dom).addClass("current");

    $.get(window.domain+"/data/detail?id="+id,function(data){
        console.log(data);
        //初始化模态框
        initModal(data);
        var obj = data.result;
        $("#data-table-title").html(obj.obj.dataName)
        var columnNamesArray = obj.columnNames;
        var html = '';
        html+='<table class="table table-condensed table-striped';
        html+=' table-hover table-bordered pull-left" id="data-table">';
        html+='<thead>';

        html+='<tr>';
        html+='<th style="width:80px">操作</th>';
        html+='<th>ID</th>';
        for(var i=0;i<obj.seqArray.length;i++){
            html+='<th>'+obj.seqArray[i]+'</th>';
        }
        html+='</tr>';
        html+='</thead>';
        html+='<tbody id="data-tbody"></tbody>';
        html+='</table>';
        html+='<div class="clearfix"></div>';
        $("#dt_example").html(html);
        $('#data-table').dataTable({
          "sPaginationType": "full_numbers"
        });
        
    });
}

//初始化模态框
function initModal(data){

    var seqArray = data.result.seqArray;
    var seqNameArray = data.result.seqNameArray;
    var html='';
    html+='<input type="hidden" name="id" id="id"/>';
    for(var i=0;i<seqArray.length;i++){
        html+='<div class="control-group">';
        html+='<input type="text" name="'+seqNameArray[i]+'" id="'+seqNameArray[i]+'" class="span11" placeholder="'+seqArray[i]+'"/>';
        html+='</div>';
    }
    $("#dataForm").html(html);

}