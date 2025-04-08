package com.entity.view;

import com.entity.WupinEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 二手市场
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("wupin")
public class WupinView extends WupinEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 物品类型的值
		*/
		private String wupinValue;
		/**
		* 物品状态的值
		*/
		private String wupinMaichuValue;



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

	public WupinView() {

	}

	public WupinView(WupinEntity wupinEntity) {
		try {
			BeanUtils.copyProperties(this, wupinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 物品类型的值
			*/
			public String getWupinValue() {
				return wupinValue;
			}
			/**
			* 设置： 物品类型的值
			*/
			public void setWupinValue(String wupinValue) {
				this.wupinValue = wupinValue;
			}
			/**
			* 获取： 物品状态的值
			*/
			public String getWupinMaichuValue() {
				return wupinMaichuValue;
			}
			/**
			* 设置： 物品状态的值
			*/
			public void setWupinMaichuValue(String wupinMaichuValue) {
				this.wupinMaichuValue = wupinMaichuValue;
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
