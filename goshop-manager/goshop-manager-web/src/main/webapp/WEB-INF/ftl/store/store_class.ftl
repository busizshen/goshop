<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>电商测试</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺分类</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>管理</span></a></li>
                <li><a href="${S_URL}/store_class/save"><span>新增</span></a></li>
                <li><a href="#"><span>导出</span></a></li>
                <li><a href="#"><span>导入</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th class="nobg" colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td><ul>
                <li>在会员开通店铺时，可指定店铺分类</li>
                <li>在店铺列表页，可以通过选择店铺分类查询店铺列表,点击分类名前“+”符号，显示当前分类的下级分类</li>
                <li><a>提交保存后，需要到 工具 -&gt; 清理缓存 清理店铺分类，新的设置才会生效</a></li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post">
        <input type="hidden" value="ok" name="form_submit">
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
                <th><input type="checkbox" id="checkall_1" class="checkall"></th>
                <th>排序</th>
                <th>分类名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
<#list P_PAGE.list as o>
            <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="w36"><input type="checkbox" class="checkitem" value="4" name="check_sc_id[]">
                    <#if (o.children?size>0) >
                        <img nc_type="flex" src="${S_URL}/static/images/tv-expandable.gif"  status="open"  fieldid="${o.id}">
                    </#if>
                 </td>
                <td class="w48 sort">
                    <span class="editable" nc_type="inline_edit" fieldname="sc_sort" fieldid="${o.id}" datatype="number" ajax_branch="store_class_sort" title="可编辑">${o.sort}</span>
                </td>
                <td class="name">
                    <span class="node_name editable" nc_type="inline_edit" fieldname="sc_name" ajax_branch="store_class_name" fieldid="${o.id}" required="1" title="分类名称">${o.name}</span>
                    <a href="save?sc_parent_id=${o.id}" class="btn-add-nofloat marginleft">新增下级</a>
                </td>
                <td class="w84"><span><a href="edit?sc_id=${o.id}">编辑</a> | <a href="javascript:if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗'))window.location = 'delete?sc_id=${o.id}';">删除</a> </span></td>
            </tr>
</#list>
            </tbody>
            <tfoot>

<#if (P_PAGE.pages>1)>
            <tr class="tfoot">
                <td colspan="4">
                <#import "../pagination.ftl" as pagination />
                    <@pagination.page  pageInfo=P_PAGE pageNumName="p" />

                </td>
            </tr>
</#if>
            <tr id="batchAction">
                <td><input type="checkbox" id="checkallBottom" class="checkall"></td>
                <td id="dataFuncs" colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a onclick="if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗')){$('form:first').submit();}" class="btn" href="JavaScript:void(0);"><span>删除</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script charset="utf-8" src="${S_URL}/static/scripts/jquery.edit.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_URL}/static/scripts/jquery.store_class.js" type="text/javascript"></script>
</body></html>