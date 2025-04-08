package com.dao;

import com.entity.XunwuCollectionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XunwuCollectionView;

/**
 * 寻物收藏 Dao 接口
 *
 * @author 
 */
public interface XunwuCollectionDao extends BaseMapper<XunwuCollectionEntity> {

   List<XunwuCollectionView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
