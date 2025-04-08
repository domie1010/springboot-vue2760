package com.entity.view;

import com.entity.HuodongEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 活动
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("huodong")
public class HuodongView extends HuodongEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 活动类型的值
		*/
		private String huodongValue;



	public HuodongView() {

	}

	public HuodongView(HuodongEntity huodongEntity) {
		try {
			BeanUtils.copyProperties(this, huodongEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 活动类型的值
			*/
			public String getHuodongValue() {
				return huodongValue;
			}
			/**
			* 设置： 活动类型的值
			*/
			public void setHuodongValue(String huodongValue) {
				this.huodongValue = huodongValue;
			}




















}
