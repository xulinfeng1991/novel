//加载表格数据
$(document).ready(function () {

    initPage();

    $.get(window.domain+"/hero/list",function(data){
        console.log(data);
        var array = data.result;
        var html = '';
        for(var i=0;i<array.length;i++){
            var hero = array[i];
            html+='<tr>';
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
    });


});

