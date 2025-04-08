package com.entity.view;

import com.entity.XunwuEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 寻物
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("xunwu")
public class XunwuView extends XunwuEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 寻物类型的值
		*/
		private String xunwuValue;
		/**
		* 寻物状态的值
		*/
		private String xunwuZhuangtaiValue;



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

	public XunwuView() {

	}

	public XunwuView(XunwuEntity xunwuEntity) {
		try {
			BeanUtils.copyProperties(this, xunwuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			/**
			* 获取： 寻物状态的值
			*/
			public String getXunwuZhuangtaiValue() {
				return xunwuZhuangtaiValue;
			}
			/**
			* 设置： 寻物状态的值
			*/
			public void setXunwuZhuangtaiValue(String xunwuZhuangtaiValue) {
				this.xunwuZhuangtaiValue = xunwuZhuangtaiValue;
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
