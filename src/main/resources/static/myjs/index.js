
$(document).ready(function () {

    //初始化页面
    initPage();
    //加载表格数据
    loadTableData();

});

function editHero(id){
    $.get(window.domain+"/hero/detail?id="+id,function(data){
        var hero = data.result;
        $('#id').val(hero.id);
        $('#name').val(hero.name);
        $('#nickName').val(hero.nickName);
        $('#home').val(hero.home);
        $('#org').val(hero.org);
        $('#magicAttribute').val(hero.magicAttribute);
        $('#weapon').val(hero.weapon);
        $('#appearScene').val(hero.appearScene);
        $('#levelDesc').val(hero.levelDesc);
        $('#story').val(hero.story);
        $('#heroModal').modal('show');
    });
}

function saveHero(){
    $.post(window.domain+"/hero/save", {
        id:$('#id').val(),
        name:$('#name').val(),
        nickName:$('#nickName').val(),
        home:$('#home').val(),
        org:$('#org').val(),
        magicAttribute:$('#magicAttribute').val(),
        weapon:$('#weapon').val(),
        appearScene:$('#appearScene').val(),
        levelDesc:$('#levelDesc').val(),
        story:$('#story').val()
        },
        function(data){
        //刷新页面
        window.location.reload()
    }, "json");
}

function loadTableData(){
    $.get(window.domain+"/hero/list",function(data){
        var array = data.result;
        var html = '';
        for(var i=0;i<array.length;i++){
            var hero = array[i];
            html+='<tr>';
            //操作栏
            html+='<td>';
            html+='<a class="delete-row" data-original-title="删除" href="javascript:void(0)"'
            +' onclick="editHero('+hero.id+')">';
            html+='<i class="icon-trash"></i>';
            html+='</a>';
            html+='<a class="delete-row" data-original-title="修改" href="javascript:void(0)"'
             +'onclick="editHero('+hero.id+')">';
            html+='<i class="icon-edit"></i>';
            html+='</a>';
            html+='</td>';

            html+='<td>'+format(hero.id)+'</td>';
            html+='<td>'+format(hero.name)+'</td>';
            html+='<td>'+format(hero.nickName)+'</td>';
            html+='<td>'+format(hero.home)+'</td>';
            html+='<td>'+format(hero.org)+'</td>';
            html+='<td class="hidden-phone">'+format(hero.magicAttribute)+'</td>';
            html+='<td class="hidden-phone">'+format(hero.weapon)+'</td>';
            html+='<td class="hidden-phone">'+format(hero.levelDesc)+'</td>';
            html+='<td class="hidden-phone">'+format(hero.story)+'</td>';

            html+='</tr>';
        }
        $("#hero-tbody").html(html);
        //Data Tables
        $('#hero-data-table').dataTable({
          "sPaginationType": "full_numbers"
        });
        $("#loading-div").html('');
        //清空表单
        $('#heroForm')[0].reset();
    });
}
