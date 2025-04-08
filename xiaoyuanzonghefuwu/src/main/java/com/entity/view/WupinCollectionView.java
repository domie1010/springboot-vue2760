package com.entity.view;

import com.entity.WupinCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 二手市场收藏
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("wupin_collection")
public class WupinCollectionView extends WupinCollectionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 类型的值
		*/
		private String wupinCollectionValue;



		//级联表 wupin
			/**
			* 二手市场 的 用户
			*/
			private Integer wupinYonghuId;
			/**
			* 物品名称
			*/
			private String wupinName;
			/**
			* 物品照片
			*/
			private String wupinPhoto;
			/**
			* 物品类型
			*/
			private Integer wupinTypes;
				/**
				* 物品类型的值
				*/
				private String wupinValue;
			/**
			* 物品购买价格
			*/
			private Double wupinOldMoney;
			/**
			* 出售价格
			*/
			private Double wupinNewMoney;

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

	public WupinCollectionView() {

	}

	public WupinCollectionView(WupinCollectionEntity wupinCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, wupinCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getWupinCollectionValue() {
				return wupinCollectionValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setWupinCollectionValue(String wupinCollectionValue) {
				this.wupinCollectionValue = wupinCollectionValue;
			}

























				//级联表的get和set wupin

					/**
					* 获取：二手市场 的 用户
					*/
					public Integer getWupinYonghuId() {
						return wupinYonghuId;
					}
					/**
					* 设置：二手市场 的 用户
					*/
					public void setWupinYonghuId(Integer wupinYonghuId) {
						this.wupinYonghuId = wupinYonghuId;
					}


					/**
					* 获取： 物品名称
					*/
					public String getWupinName() {
						return wupinName;
					}
					/**
					* 设置： 物品名称
					*/
					public void setWupinName(String wupinName) {
						this.wupinName = wupinName;
					}

					/**
					* 获取： 物品照片
					*/
					public String getWupinPhoto() {
						return wupinPhoto;
					}
					/**
					* 设置： 物品照片
					*/
					public void setWupinPhoto(String wupinPhoto) {
						this.wupinPhoto = wupinPhoto;
					}

					/**
					* 获取： 物品类型
					*/
					public Integer getWupinTypes() {
						return wupinTypes;
					}
					/**
					* 设置： 物品类型
					*/
					public void setWupinTypes(Integer wupinTypes) {
						this.wupinTypes = wupinTypes;
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
					* 获取： 物品购买价格
					*/
					public Double getWupinOldMoney() {
						return wupinOldMoney;
					}
					/**
					* 设置： 物品购买价格
					*/
					public void setWupinOldMoney(Double wupinOldMoney) {
						this.wupinOldMoney = wupinOldMoney;
					}

					/**
					* 获取： 出售价格
					*/
					public Double getWupinNewMoney() {
						return wupinNewMoney;
					}
					/**
					* 设置： 出售价格
					*/
					public void setWupinNewMoney(Double wupinNewMoney) {
						this.wupinNewMoney = wupinNewMoney;
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
