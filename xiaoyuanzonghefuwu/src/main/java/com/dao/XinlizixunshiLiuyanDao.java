package com.dao;

import com.entity.XinlizixunshiLiuyanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XinlizixunshiLiuyanView;

/**
 * 心里咨询师留言 Dao 接口
 *
 * @author 
 */
public interface XinlizixunshiLiuyanDao extends BaseMapper<XinlizixunshiLiuyanEntity> {

   List<XinlizixunshiLiuyanView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
