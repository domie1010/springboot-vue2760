package com.dao;

import com.entity.XinlizixunshiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XinlizixunshiView;

/**
 * 心里咨询师 Dao 接口
 *
 * @author 
 */
public interface XinlizixunshiDao extends BaseMapper<XinlizixunshiEntity> {

   List<XinlizixunshiView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
