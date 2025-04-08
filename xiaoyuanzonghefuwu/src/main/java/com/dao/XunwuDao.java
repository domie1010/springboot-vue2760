package com.dao;

import com.entity.XunwuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XunwuView;

/**
 * 寻物 Dao 接口
 *
 * @author 
 */
public interface XunwuDao extends BaseMapper<XunwuEntity> {

   List<XunwuView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
