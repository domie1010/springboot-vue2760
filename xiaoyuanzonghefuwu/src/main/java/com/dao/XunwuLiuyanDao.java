package com.dao;

import com.entity.XunwuLiuyanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XunwuLiuyanView;

/**
 * 寻物留言 Dao 接口
 *
 * @author 
 */
public interface XunwuLiuyanDao extends BaseMapper<XunwuLiuyanEntity> {

   List<XunwuLiuyanView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
