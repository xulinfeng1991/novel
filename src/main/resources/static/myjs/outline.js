
$(document).ready(function () {
    $(".top-nav").load("top-nav.html",function() {
        $("#top-nav-outline").attr("class", "selected");
    });
    loadSelect();
});

function loadSelect(){
    $.get(window.domain+"/outline/list?parentId=-1",function(data){
        var array = data.result;
        var html = '<option value="-1">总纲</option>';
        for(var i=0;i<array.length;i++){
            var outline = array[i];
            html+='<option value="'+outline.id+'">';
            html+=outline.title;
            html+='</option>';
        }
        $("#outline-select").html(html);
        $("#parentId").html(html);

        $("#outline-select").change(function(){
            $("#parentId").val($("#outline-select").val());
            loadTableData();
        });
        loadTableData();
    });
}

function editOutline(id){
    $.get(window.domain+"/outline/detail?id="+id,function(data){
        var outline = data.result;
        $('#id').val(outline.id);
        $('#parentId').val(outline.parentId);
        $('#title').val(outline.title);
        $('#plot').val(outline.plot);
        $('#bossLevel').val(outline.bossLevel);
        $('#mainPeople').val(outline.mainPeople);
        $('#story').val(outline.story);
        $('#material').val(outline.material);
        $('#outlineModal').modal('show');
    });
}

function saveOutline(){
    $.post(window.domain+"/outline/save", {
        id:$('#id').val(),
        parentId:$('#parentId').val(),
        nickName:$('#nickName').val(),
        title:$('#title').val(),
        plot:$('#plot').val(),
        bossLevel:$('#bossLevel').val(),
        mainPeople:$('#mainPeople').val(),
        story:$('#story').val(),
        material:$('#material').val()
        },
        function(data){
            $('#outlineModal').modal('hide')
            loadTableData()
    }, "json");
}

function loadTableData(){
    $.get(window.domain+"/outline/list?parentId="+$("#outline-select").val(),function(data){
        var array = data.result;
        var html = '';
        for(var i=0;i<array.length;i++){
            var outline = array[i];
            html+='<tr>';
            //操作栏
            html+='<td>';
            html+='<a class="delete-row" data-original-title="删除" href="javascript:void(0)"'
            +' onclick="editOutline('+outline.id+')">';
            html+='<i class="icon-trash"></i>';
            html+='</a>';
            html+='<a class="delete-row" data-original-title="修改" href="javascript:void(0)"'
             +'onclick="editOutline('+outline.id+')">';
            html+='<i class="icon-edit"></i>';
            html+='</a>';
            html+='</td>';

            html+='<td>'+format(outline.id)+'</td>';
            html+='<td>'+format(outline.title)+'</td>';
            html+='<td>'+format(outline.plot)+'</td>';
            html+='<td>'+format(outline.bossLevel)+'</td>';
            html+='<td>'+format(outline.mainPeople)+'</td>';
            html+='<td class="hidden-phone">'+format(outline.story)+'</td>';
            html+='<td class="hidden-phone">'+format(outline.material)+'</td>';

            html+='</tr>';
        }
        $("#outline-tbody").html(html);
        $("#loading-div").html('');
        //清空表单
        $('#outlineForm')[0].reset();
    });
}
