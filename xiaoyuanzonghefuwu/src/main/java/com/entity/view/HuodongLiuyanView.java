package com.entity.view;

import com.entity.HuodongLiuyanEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 活动留言
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("huodong_liuyan")
public class HuodongLiuyanView extends HuodongLiuyanEntity implements Serializable {
    private static final long serialVersionUID = 1L;




		//级联表 huodong
			/**
			* 活动编号
			*/
			private String huodongUuidNumber;
			/**
			* 活动名称
			*/
			private String huodongName;
			/**
			* 活动照片
			*/
			private String huodongPhoto;
			/**
			* 活动类型
			*/
			private Integer huodongTypes;
				/**
				* 活动类型的值
				*/
				private String huodongValue;

		//级联表 yonghu
			/**
			* 用户姓名
			*/
			private String yonghuName;
			/**
			* 用户手机号
			*/
			private String yonghuPhone;
			/**
			* 用户头像
			*/
			private String yonghuPhoto;

	public HuodongLiuyanView() {

	}

	public HuodongLiuyanView(HuodongLiuyanEntity huodongLiuyanEntity) {
		try {
			BeanUtils.copyProperties(this, huodongLiuyanEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
















				//级联表的get和set huodong

					/**
					* 获取： 活动编号
					*/
					public String getHuodongUuidNumber() {
						return huodongUuidNumber;
					}
					/**
					* 设置： 活动编号
					*/
					public void setHuodongUuidNumber(String huodongUuidNumber) {
						this.huodongUuidNumber = huodongUuidNumber;
					}

					/**
					* 获取： 活动名称
					*/
					public String getHuodongName() {
						return huodongName;
					}
					/**
					* 设置： 活动名称
					*/
					public void setHuodongName(String huodongName) {
						this.huodongName = huodongName;
					}

					/**
					* 获取： 活动照片
					*/
					public String getHuodongPhoto() {
						return huodongPhoto;
					}
					/**
					* 设置： 活动照片
					*/
					public void setHuodongPhoto(String huodongPhoto) {
						this.huodongPhoto = huodongPhoto;
					}

					/**
					* 获取： 活动类型
					*/
					public Integer getHuodongTypes() {
						return huodongTypes;
					}
					/**
					* 设置： 活动类型
					*/
					public void setHuodongTypes(Integer huodongTypes) {
						this.huodongTypes = huodongTypes;
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








































				//级联表的get和set yonghu

					/**
					* 获取： 用户姓名
					*/
					public String getYonghuName() {
						return yonghuName;
					}
					/**
					* 设置： 用户姓名
					*/
					public void setYonghuName(String yonghuName) {
						this.yonghuName = yonghuName;
					}

					/**
					* 获取： 用户手机号
					*/
					public String getYonghuPhone() {
						return yonghuPhone;
					}
					/**
					* 设置： 用户手机号
					*/
					public void setYonghuPhone(String yonghuPhone) {
						this.yonghuPhone = yonghuPhone;
					}

					/**
					* 获取： 用户头像
					*/
					public String getYonghuPhoto() {
						return yonghuPhoto;
					}
					/**
					* 设置： 用户头像
					*/
					public void setYonghuPhoto(String yonghuPhoto) {
						this.yonghuPhoto = yonghuPhoto;
					}



}
