package com.entity.view;

import com.entity.XinlizixunshiCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 心里咨询师收藏
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("xinlizixunshi_collection")
public class XinlizixunshiCollectionView extends XinlizixunshiCollectionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 类型的值
		*/
		private String xinlizixunshiCollectionValue;



		//级联表 xinlizixunshi
			/**
			* 咨询师姓名
			*/
			private String xinlizixunshiName;
			/**
			* 咨询师手机号
			*/
			private String xinlizixunshiPhone;
			/**
			* 咨询师照片
			*/
			private String xinlizixunshiPhoto;

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

	public XinlizixunshiCollectionView() {

	}

	public XinlizixunshiCollectionView(XinlizixunshiCollectionEntity xinlizixunshiCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, xinlizixunshiCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getXinlizixunshiCollectionValue() {
				return xinlizixunshiCollectionValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setXinlizixunshiCollectionValue(String xinlizixunshiCollectionValue) {
				this.xinlizixunshiCollectionValue = xinlizixunshiCollectionValue;
			}


































				//级联表的get和set xinlizixunshi

					/**
					* 获取： 咨询师姓名
					*/
					public String getXinlizixunshiName() {
						return xinlizixunshiName;
					}
					/**
					* 设置： 咨询师姓名
					*/
					public void setXinlizixunshiName(String xinlizixunshiName) {
						this.xinlizixunshiName = xinlizixunshiName;
					}

					/**
					* 获取： 咨询师手机号
					*/
					public String getXinlizixunshiPhone() {
						return xinlizixunshiPhone;
					}
					/**
					* 设置： 咨询师手机号
					*/
					public void setXinlizixunshiPhone(String xinlizixunshiPhone) {
						this.xinlizixunshiPhone = xinlizixunshiPhone;
					}

					/**
					* 获取： 咨询师照片
					*/
					public String getXinlizixunshiPhoto() {
						return xinlizixunshiPhoto;
					}
					/**
					* 设置： 咨询师照片
					*/
					public void setXinlizixunshiPhoto(String xinlizixunshiPhoto) {
						this.xinlizixunshiPhoto = xinlizixunshiPhoto;
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
