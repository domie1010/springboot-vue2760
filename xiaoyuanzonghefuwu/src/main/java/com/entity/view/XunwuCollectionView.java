package com.entity.view;

import com.entity.XunwuCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 寻物收藏
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("xunwu_collection")
public class XunwuCollectionView extends XunwuCollectionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 类型的值
		*/
		private String xunwuCollectionValue;



		//级联表 xunwu
			/**
			* 寻物 的 用户
			*/
			private Integer xunwuYonghuId;
			/**
			* 寻物名称
			*/
			private String xunwuName;
			/**
			* 寻物照片
			*/
			private String xunwuPhoto;
			/**
			* 寻物类型
			*/
			private Integer xunwuTypes;
				/**
				* 寻物类型的值
				*/
				private String xunwuValue;

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

	public XunwuCollectionView() {

	}

	public XunwuCollectionView(XunwuCollectionEntity xunwuCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, xunwuCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getXunwuCollectionValue() {
				return xunwuCollectionValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setXunwuCollectionValue(String xunwuCollectionValue) {
				this.xunwuCollectionValue = xunwuCollectionValue;
			}











































				//级联表的get和set xunwu

					/**
					* 获取：寻物 的 用户
					*/
					public Integer getXunwuYonghuId() {
						return xunwuYonghuId;
					}
					/**
					* 设置：寻物 的 用户
					*/
					public void setXunwuYonghuId(Integer xunwuYonghuId) {
						this.xunwuYonghuId = xunwuYonghuId;
					}


					/**
					* 获取： 寻物名称
					*/
					public String getXunwuName() {
						return xunwuName;
					}
					/**
					* 设置： 寻物名称
					*/
					public void setXunwuName(String xunwuName) {
						this.xunwuName = xunwuName;
					}

					/**
					* 获取： 寻物照片
					*/
					public String getXunwuPhoto() {
						return xunwuPhoto;
					}
					/**
					* 设置： 寻物照片
					*/
					public void setXunwuPhoto(String xunwuPhoto) {
						this.xunwuPhoto = xunwuPhoto;
					}

					/**
					* 获取： 寻物类型
					*/
					public Integer getXunwuTypes() {
						return xunwuTypes;
					}
					/**
					* 设置： 寻物类型
					*/
					public void setXunwuTypes(Integer xunwuTypes) {
						this.xunwuTypes = xunwuTypes;
					}


						/**
						* 获取： 寻物类型的值
						*/
						public String getXunwuValue() {
							return xunwuValue;
						}
						/**
						* 设置： 寻物类型的值
						*/
						public void setXunwuValue(String xunwuValue) {
							this.xunwuValue = xunwuValue;
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
