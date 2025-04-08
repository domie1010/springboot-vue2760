package com.dao;

import com.entity.XinlizixunshiCollectionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.XinlizixunshiCollectionView;

/**
 * 心里咨询师收藏 Dao 接口
 *
 * @author 
 */
public interface XinlizixunshiCollectionDao extends BaseMapper<XinlizixunshiCollectionEntity> {

   List<XinlizixunshiCollectionView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
