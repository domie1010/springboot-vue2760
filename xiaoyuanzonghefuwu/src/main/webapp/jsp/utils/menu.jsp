<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
var menus = [

	{
        "backMenu":[
            {
                "child":[
                    {
                        "buttons":[
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"轮播图管理",
                        "menuJump":"列表",
                        "tableName":"config"
                    }
                ],
                "menu":"轮播图信息"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "回复",
                            "删除"
                        ],
                        "menu":"客服聊天管理",
                        "menuJump":"列表",
                        "tableName":"chat"
                    }
                ],
                "menu":"客服聊天管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"帖子类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryForum"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"活动类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryHuodong"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"物品类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryWupin"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"寻物类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryXunwu"
                    }
                ],
                "menu":"基础数据管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"论坛管理",
                        "menuJump":"列表",
                        "tableName":"forum"
                    }
                ],
                "menu":"论坛管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"活动管理",
                        "menuJump":"列表",
                        "tableName":"huodong"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改",
                            "删除"
                        ],
                        "menu":"活动留言管理",
                        "menuJump":"列表",
                        "tableName":"huodongLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"活动收藏管理",
                        "menuJump":"列表",
                        "tableName":"huodongCollection"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"活动报名管理",
                        "menuJump":"列表",
                        "tableName":"huodongOrder"
                    }
                ],
                "menu":"活动管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"二手市场管理",
                        "menuJump":"列表",
                        "tableName":"wupin"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改",
                            "删除"
                        ],
                        "menu":"二手市场留言管理",
                        "menuJump":"列表",
                        "tableName":"wupinLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"二手市场收藏管理",
                        "menuJump":"列表",
                        "tableName":"wupinCollection"
                    }
                ],
                "menu":"二手市场管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"心里咨询师管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshi"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改",
                            "删除"
                        ],
                        "menu":"心里咨询师留言管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshiLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"心里咨询师收藏管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshiCollection"
                    }
                ],
                "menu":"心里咨询师管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"寻物管理",
                        "menuJump":"列表",
                        "tableName":"xunwu"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改",
                            "删除"
                        ],
                        "menu":"寻物留言管理",
                        "menuJump":"列表",
                        "tableName":"xunwuLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"寻物收藏管理",
                        "menuJump":"列表",
                        "tableName":"xunwuCollection"
                    }
                ],
                "menu":"寻物管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"用户管理",
                        "menuJump":"列表",
                        "tableName":"yonghu"
                    }
                ],
                "menu":"用户管理"
            }
        ],
        "frontMenu":[

        ],
        "roleName":"管理员",
        "tableName":"users"
    }
	,
	{
        "backMenu":[
            {
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"论坛管理",
                        "menuJump":"列表",
                        "tableName":"forum"
                    }
                ],
                "menu":"论坛管理"
            }
            ,{
                "child":[
                    
                    {
                        "buttons":[
                            "查看",
                            "修改"
                        ],
                        "menu":"心里咨询师留言管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshiLiuyan"
                    }
                ],
                "menu":"心里咨询师留言管理"
            }
        ],
        "frontMenu":[

        ],
        "roleName":"心里咨询师",
        "tableName":"xinlizixunshi"
    }
	,
	{
        "backMenu":[
            {
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"论坛管理",
                        "menuJump":"列表",
                        "tableName":"forum"
                    }
                ],
                "menu":"论坛管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"活动管理",
                        "menuJump":"列表",
                        "tableName":"huodong"
                    }
                    ,
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"活动留言管理",
                        "menuJump":"列表",
                        "tableName":"huodongLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"活动收藏管理",
                        "menuJump":"列表",
                        "tableName":"huodongCollection"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"活动报名管理",
                        "menuJump":"列表",
                        "tableName":"huodongOrder"
                    }
                ],
                "menu":"活动管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"二手市场管理",
                        "menuJump":"列表",
                        "tableName":"wupin"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改"
                        ],
                        "menu":"二手市场留言管理",
                        "menuJump":"列表",
                        "tableName":"wupinLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"二手市场收藏管理",
                        "menuJump":"列表",
                        "tableName":"wupinCollection"
                    }
                ],
                "menu":"二手市场管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"心里咨询师管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshi"
                    }
                    ,
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"心里咨询师留言管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshiLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "删除"
                        ],
                        "menu":"心里咨询师收藏管理",
                        "menuJump":"列表",
                        "tableName":"xinlizixunshiCollection"
                    }
                ],
                "menu":"心里咨询师管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"寻物管理",
                        "menuJump":"列表",
                        "tableName":"xunwu"
                    }
                    ,
                    {
                        "buttons":[
                            "查看",
                            "修改"
                        ],
                        "menu":"寻物留言管理",
                        "menuJump":"列表",
                        "tableName":"xunwuLiuyan"
                    }
                    ,
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"寻物收藏管理",
                        "menuJump":"列表",
                        "tableName":"xunwuCollection"
                    }
                ],
                "menu":"寻物管理"
            }
        ],
        "frontMenu":[

        ],
        "roleName":"用户",
        "tableName":"yonghu"
    }
];

var hasMessage = '';
