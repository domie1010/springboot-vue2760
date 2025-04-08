
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 心里咨询师
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/xinlizixunshi")
public class XinlizixunshiController {
    private static final Logger logger = LoggerFactory.getLogger(XinlizixunshiController.class);

    @Autowired
    private XinlizixunshiService xinlizixunshiService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service

    @Autowired
    private YonghuService yonghuService;


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("心里咨询师".equals(role))
            params.put("xinlizixunshiId",request.getSession().getAttribute("userId"));
        if(params.get("orderBy")==null || params.get("orderBy")==""){
            params.put("orderBy","id");
        }
        PageUtils page = xinlizixunshiService.queryPage(params);

        //字典表数据转换
        List<XinlizixunshiView> list =(List<XinlizixunshiView>)page.getList();
        for(XinlizixunshiView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        XinlizixunshiEntity xinlizixunshi = xinlizixunshiService.selectById(id);
        if(xinlizixunshi !=null){
            //entity转view
            XinlizixunshiView view = new XinlizixunshiView();
            BeanUtils.copyProperties( xinlizixunshi , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody XinlizixunshiEntity xinlizixunshi, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,xinlizixunshi:{}",this.getClass().getName(),xinlizixunshi.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<XinlizixunshiEntity> queryWrapper = new EntityWrapper<XinlizixunshiEntity>()
            .eq("username", xinlizixunshi.getUsername())
            .or()
            .eq("xinlizixunshi_phone", xinlizixunshi.getXinlizixunshiPhone())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        XinlizixunshiEntity xinlizixunshiEntity = xinlizixunshiService.selectOne(queryWrapper);
        if(xinlizixunshiEntity==null){
            xinlizixunshi.setCreateTime(new Date());
            xinlizixunshi.setPassword("123456");
            xinlizixunshiService.insert(xinlizixunshi);
            return R.ok();
        }else {
            return R.error(511,"账户或者咨询师手机号已经被使用");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody XinlizixunshiEntity xinlizixunshi, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,xinlizixunshi:{}",this.getClass().getName(),xinlizixunshi.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        //根据字段查询是否有相同数据
        Wrapper<XinlizixunshiEntity> queryWrapper = new EntityWrapper<XinlizixunshiEntity>()
            .notIn("id",xinlizixunshi.getId())
            .andNew()
            .eq("username", xinlizixunshi.getUsername())
            .or()
            .eq("xinlizixunshi_phone", xinlizixunshi.getXinlizixunshiPhone())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        XinlizixunshiEntity xinlizixunshiEntity = xinlizixunshiService.selectOne(queryWrapper);
        if("".equals(xinlizixunshi.getXinlizixunshiPhoto()) || "null".equals(xinlizixunshi.getXinlizixunshiPhoto())){
                xinlizixunshi.setXinlizixunshiPhoto(null);
        }
        if(xinlizixunshiEntity==null){
            xinlizixunshiService.updateById(xinlizixunshi);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"账户或者咨询师手机号已经被使用");
        }
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        xinlizixunshiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<XinlizixunshiEntity> xinlizixunshiList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("../../upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            XinlizixunshiEntity xinlizixunshiEntity = new XinlizixunshiEntity();
//                            xinlizixunshiEntity.setUsername(data.get(0));                    //账户 要改的
//                            //xinlizixunshiEntity.setPassword("123456");//密码
//                            xinlizixunshiEntity.setXinlizixunshiName(data.get(0));                    //咨询师姓名 要改的
//                            xinlizixunshiEntity.setXinlizixunshiPhone(data.get(0));                    //咨询师手机号 要改的
//                            xinlizixunshiEntity.setXinlizixunshiPhoto("");//详情和图片
//                            xinlizixunshiEntity.setXinlizixunshiShanchang(data.get(0));                    //擅长 要改的
//                            xinlizixunshiEntity.setXinlizixunshiEmail(data.get(0));                    //电子邮箱 要改的
//                            xinlizixunshiEntity.setSexTypes(Integer.valueOf(data.get(0)));   //性别 要改的
//                            xinlizixunshiEntity.setXinlizixunshiContent("");//详情和图片
//                            xinlizixunshiEntity.setCreateTime(date);//时间
                            xinlizixunshiList.add(xinlizixunshiEntity);


                            //把要查询是否重复的字段放入map中
                                //账户
                                if(seachFields.containsKey("username")){
                                    List<String> username = seachFields.get("username");
                                    username.add(data.get(0));//要改的
                                }else{
                                    List<String> username = new ArrayList<>();
                                    username.add(data.get(0));//要改的
                                    seachFields.put("username",username);
                                }
                                //咨询师手机号
                                if(seachFields.containsKey("xinlizixunshiPhone")){
                                    List<String> xinlizixunshiPhone = seachFields.get("xinlizixunshiPhone");
                                    xinlizixunshiPhone.add(data.get(0));//要改的
                                }else{
                                    List<String> xinlizixunshiPhone = new ArrayList<>();
                                    xinlizixunshiPhone.add(data.get(0));//要改的
                                    seachFields.put("xinlizixunshiPhone",xinlizixunshiPhone);
                                }
                        }

                        //查询是否重复
                         //账户
                        List<XinlizixunshiEntity> xinlizixunshiEntities_username = xinlizixunshiService.selectList(new EntityWrapper<XinlizixunshiEntity>().in("username", seachFields.get("username")));
                        if(xinlizixunshiEntities_username.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(XinlizixunshiEntity s:xinlizixunshiEntities_username){
                                repeatFields.add(s.getUsername());
                            }
                            return R.error(511,"数据库的该表中的 [账户] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //咨询师手机号
                        List<XinlizixunshiEntity> xinlizixunshiEntities_xinlizixunshiPhone = xinlizixunshiService.selectList(new EntityWrapper<XinlizixunshiEntity>().in("xinlizixunshi_phone", seachFields.get("xinlizixunshiPhone")));
                        if(xinlizixunshiEntities_xinlizixunshiPhone.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(XinlizixunshiEntity s:xinlizixunshiEntities_xinlizixunshiPhone){
                                repeatFields.add(s.getXinlizixunshiPhone());
                            }
                            return R.error(511,"数据库的该表中的 [咨询师手机号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        xinlizixunshiService.insertBatch(xinlizixunshiList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }


    /**
    * 登录
    */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        XinlizixunshiEntity xinlizixunshi = xinlizixunshiService.selectOne(new EntityWrapper<XinlizixunshiEntity>().eq("username", username));
        if(xinlizixunshi==null || !xinlizixunshi.getPassword().equals(password))
            return R.error("账号或密码不正确");
        //  // 获取监听器中的字典表
        // ServletContext servletContext = ContextLoader.getCurrentWebApplicationContext().getServletContext();
        // Map<String, Map<Integer, String>> dictionaryMap= (Map<String, Map<Integer, String>>) servletContext.getAttribute("dictionaryMap");
        // Map<Integer, String> role_types = dictionaryMap.get("role_types");
        // role_types.get(.getRoleTypes());
        String token = tokenService.generateToken(xinlizixunshi.getId(),username, "xinlizixunshi", "心里咨询师");
        R r = R.ok();
        r.put("token", token);
        r.put("role","心里咨询师");
        r.put("username",xinlizixunshi.getXinlizixunshiName());
        r.put("tableName","xinlizixunshi");
        r.put("userId",xinlizixunshi.getId());
        return r;
    }

    /**
    * 注册
    */
    @IgnoreAuth
    @PostMapping(value = "/register")
    public R register(@RequestBody XinlizixunshiEntity xinlizixunshi){
//    	ValidatorUtils.validateEntity(user);
        Wrapper<XinlizixunshiEntity> queryWrapper = new EntityWrapper<XinlizixunshiEntity>()
            .eq("username", xinlizixunshi.getUsername())
            .or()
            .eq("xinlizixunshi_phone", xinlizixunshi.getXinlizixunshiPhone())
            ;
        XinlizixunshiEntity xinlizixunshiEntity = xinlizixunshiService.selectOne(queryWrapper);
        if(xinlizixunshiEntity != null)
            return R.error("账户或者咨询师手机号已经被使用");
        xinlizixunshi.setCreateTime(new Date());
        xinlizixunshiService.insert(xinlizixunshi);
        return R.ok();
    }

    /**
     * 重置密码
     */
    @GetMapping(value = "/resetPassword")
    public R resetPassword(Integer  id){
        XinlizixunshiEntity xinlizixunshi = new XinlizixunshiEntity();
        xinlizixunshi.setPassword("123456");
        xinlizixunshi.setId(id);
        xinlizixunshiService.updateById(xinlizixunshi);
        return R.ok();
    }


    /**
     * 忘记密码
     */
    @IgnoreAuth
    @RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request) {
        XinlizixunshiEntity xinlizixunshi = xinlizixunshiService.selectOne(new EntityWrapper<XinlizixunshiEntity>().eq("username", username));
        if(xinlizixunshi!=null){
            xinlizixunshi.setPassword("123456");
            boolean b = xinlizixunshiService.updateById(xinlizixunshi);
            if(!b){
               return R.error();
            }
        }else{
           return R.error("账号不存在");
        }
        return R.ok();
    }


    /**
    * 获取用户的session用户信息
    */
    @RequestMapping("/session")
    public R getCurrXinlizixunshi(HttpServletRequest request){
        Integer id = (Integer)request.getSession().getAttribute("userId");
        XinlizixunshiEntity xinlizixunshi = xinlizixunshiService.selectById(id);
        if(xinlizixunshi !=null){
            //entity转view
            XinlizixunshiView view = new XinlizixunshiView();
            BeanUtils.copyProperties( xinlizixunshi , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }
    }


    /**
    * 退出
    */
    @GetMapping(value = "logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
    }




    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        // 没有指定排序字段就默认id倒序
        if(StringUtil.isEmpty(String.valueOf(params.get("orderBy")))){
            params.put("orderBy","id");
        }
        PageUtils page = xinlizixunshiService.queryPage(params);

        //字典表数据转换
        List<XinlizixunshiView> list =(List<XinlizixunshiView>)page.getList();
        for(XinlizixunshiView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        XinlizixunshiEntity xinlizixunshi = xinlizixunshiService.selectById(id);
            if(xinlizixunshi !=null){


                //entity转view
                XinlizixunshiView view = new XinlizixunshiView();
                BeanUtils.copyProperties( xinlizixunshi , view );//把实体数据重构到view中

                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody XinlizixunshiEntity xinlizixunshi, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,xinlizixunshi:{}",this.getClass().getName(),xinlizixunshi.toString());
        Wrapper<XinlizixunshiEntity> queryWrapper = new EntityWrapper<XinlizixunshiEntity>()
            .eq("username", xinlizixunshi.getUsername())
            .or()
            .eq("xinlizixunshi_phone", xinlizixunshi.getXinlizixunshiPhone())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        XinlizixunshiEntity xinlizixunshiEntity = xinlizixunshiService.selectOne(queryWrapper);
        if(xinlizixunshiEntity==null){
            xinlizixunshi.setCreateTime(new Date());
        xinlizixunshi.setPassword("123456");
        xinlizixunshiService.insert(xinlizixunshi);
            return R.ok();
        }else {
            return R.error(511,"账户或者咨询师手机号已经被使用");
        }
    }


}
