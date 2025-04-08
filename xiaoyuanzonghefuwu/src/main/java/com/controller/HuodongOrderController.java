
package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.HuodongEntity;
import com.entity.HuodongOrderEntity;
import com.entity.YonghuEntity;
import com.entity.view.HuodongOrderView;
import com.service.*;
import com.utils.PageUtils;
import com.utils.PoiUtil;
import com.utils.R;
import com.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 活动报名
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/huodongOrder")
public class HuodongOrderController {
    private static final Logger logger = LoggerFactory.getLogger(HuodongOrderController.class);

    @Autowired
    private HuodongOrderService huodongOrderService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service
    @Autowired
    private HuodongService huodongService;
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
        PageUtils page = huodongOrderService.queryPage(params);

        //字典表数据转换
        List<HuodongOrderView> list =(List<HuodongOrderView>)page.getList();
        for(HuodongOrderView c:list){
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
        HuodongOrderEntity huodongOrder = huodongOrderService.selectById(id);
        if(huodongOrder !=null){
            //entity转view
            HuodongOrderView view = new HuodongOrderView();
            BeanUtils.copyProperties( huodongOrder , view );//把实体数据重构到view中

                //级联表
                HuodongEntity huodong = huodongService.selectById(huodongOrder.getHuodongId());
                if(huodong != null){
                    BeanUtils.copyProperties( huodong , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setHuodongId(huodong.getId());
                }
                //级联表
                YonghuEntity yonghu = yonghuService.selectById(huodongOrder.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
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
    public R save(@RequestBody HuodongOrderEntity huodongOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,huodongOrder:{}",this.getClass().getName(),huodongOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            huodongOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        huodongOrder.setInsertTime(new Date());
        huodongOrder.setCreateTime(new Date());
        huodongOrderService.insert(huodongOrder);
        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody HuodongOrderEntity huodongOrder, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,huodongOrder:{}",this.getClass().getName(),huodongOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            huodongOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        //根据字段查询是否有相同数据
        Wrapper<HuodongOrderEntity> queryWrapper = new EntityWrapper<HuodongOrderEntity>()
            .eq("id",0)
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        HuodongOrderEntity huodongOrderEntity = huodongOrderService.selectOne(queryWrapper);
        if(huodongOrderEntity==null){
            huodongOrderService.updateById(huodongOrder);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        huodongOrderService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save(String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<HuodongOrderEntity> huodongOrderList = new ArrayList<>();//上传的东西
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
                            HuodongOrderEntity huodongOrderEntity = new HuodongOrderEntity();
//                            huodongOrderEntity.setHuodongId(Integer.valueOf(data.get(0)));   //活动 要改的
//                            huodongOrderEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            huodongOrderEntity.setInsertTime(date);//时间
//                            huodongOrderEntity.setCreateTime(date);//时间
                            huodongOrderList.add(huodongOrderEntity);


                            //把要查询是否重复的字段放入map中
                        }

                        //查询是否重复
                        huodongOrderService.insertBatch(huodongOrderList);
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
        PageUtils page = huodongOrderService.queryPage(params);

        //字典表数据转换
        List<HuodongOrderView> list =(List<HuodongOrderView>)page.getList();
        for(HuodongOrderView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        HuodongOrderEntity huodongOrder = huodongOrderService.selectById(id);
            if(huodongOrder !=null){


                //entity转view
                HuodongOrderView view = new HuodongOrderView();
                BeanUtils.copyProperties( huodongOrder , view );//把实体数据重构到view中

                //级联表
                    HuodongEntity huodong = huodongService.selectById(huodongOrder.getHuodongId());
                if(huodong != null){
                    BeanUtils.copyProperties( huodong , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setHuodongId(huodong.getId());
                }
                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(huodongOrder.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
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
    public R add(@RequestBody HuodongOrderEntity huodongOrder, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,huodongOrder:{}",this.getClass().getName(),huodongOrder.toString());
            HuodongEntity huodongEntity = huodongService.selectById(huodongOrder.getHuodongId());
            if(huodongEntity == null){
                return R.error(511,"查不到该活动");
            }
            // Double huodongNewMoney = huodongEntity.getHuodongNewMoney();

        HuodongOrderEntity huodongOrderEntity = huodongOrderService.selectOne(new EntityWrapper<HuodongOrderEntity>().eq("huodong_id", huodongOrder.getHuodongId()).eq("yonghu_id", huodongOrder.getYonghuId()));
            if(huodongOrderEntity != null)
                return R.error("当前用户已经预约参与了该活动,不能重复参与");


        huodongOrder.setInsertTime(new Date());
            huodongOrder.setCreateTime(new Date());
                huodongOrderService.insert(huodongOrder);//新增订单
            return R.ok();
    }



}
