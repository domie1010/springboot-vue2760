package com.service.impl;

import com.utils.StringUtil;
import org.springframework.stereotype.Service;
import java.lang.reflect.Field;
import java.util.*;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.transaction.annotation.Transactional;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.dao.XunwuCollectionDao;
import com.entity.XunwuCollectionEntity;
import com.service.XunwuCollectionService;
import com.entity.view.XunwuCollectionView;

/**
 * 寻物收藏 服务实现类
 */
@Service("xunwuCollectionService")
@Transactional
public class XunwuCollectionServiceImpl extends ServiceImpl<XunwuCollectionDao, XunwuCollectionEntity> implements XunwuCollectionService {

    @Override
    public PageUtils queryPage(Map<String,Object> params) {
        if(params != null && (params.get("limit") == null || params.get("page") == null)){
            params.put("page","1");
            params.put("limit","10");
        }
        Page<XunwuCollectionView> page =new Query<XunwuCollectionView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,params));
        return new PageUtils(page);
    }


}
