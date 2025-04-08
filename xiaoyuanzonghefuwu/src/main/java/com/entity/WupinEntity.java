package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 二手市场
 *
 * @author 
 * @email
 */
@TableName("wupin")
public class WupinEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public WupinEntity() {

	}

	public WupinEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Integer id;


    /**
     * 用户
     */
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 物品名称
     */
    @TableField(value = "wupin_name")

    private String wupinName;


    /**
     * 物品照片
     */
    @TableField(value = "wupin_photo")

    private String wupinPhoto;


    /**
     * 交易地点
     */
    @TableField(value = "wupin_address")

    private String wupinAddress;


    /**
     * 联系人
     */
    @TableField(value = "lianxiren_name")

    private String lianxirenName;


    /**
     * 联系人电话
     */
    @TableField(value = "lianxiren_phone")

    private String lianxirenPhone;


    /**
     * 物品类型
     */
    @TableField(value = "wupin_types")

    private Integer wupinTypes;


    /**
     * 物品数量
     */
    @TableField(value = "wupin_number")

    private Integer wupinNumber;


    /**
     * 物品状态
     */
    @TableField(value = "wupin_maichu_types")

    private Integer wupinMaichuTypes;


    /**
     * 物品购买价格
     */
    @TableField(value = "wupin_old_money")

    private Double wupinOldMoney;


    /**
     * 出售价格
     */
    @TableField(value = "wupin_new_money")

    private Double wupinNewMoney;


    /**
     * 物品介绍
     */
    @TableField(value = "wupin_content")

    private String wupinContent;


    /**
     * 逻辑删除
     */
    @TableField(value = "wupin_delete")

    private Integer wupinDelete;


    /**
     * 发布时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }
    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }
    /**
	 * 获取：用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：物品名称
	 */
    public String getWupinName() {
        return wupinName;
    }
    /**
	 * 获取：物品名称
	 */

    public void setWupinName(String wupinName) {
        this.wupinName = wupinName;
    }
    /**
	 * 设置：物品照片
	 */
    public String getWupinPhoto() {
        return wupinPhoto;
    }
    /**
	 * 获取：物品照片
	 */

    public void setWupinPhoto(String wupinPhoto) {
        this.wupinPhoto = wupinPhoto;
    }
    /**
	 * 设置：交易地点
	 */
    public String getWupinAddress() {
        return wupinAddress;
    }
    /**
	 * 获取：交易地点
	 */

    public void setWupinAddress(String wupinAddress) {
        this.wupinAddress = wupinAddress;
    }
    /**
	 * 设置：联系人
	 */
    public String getLianxirenName() {
        return lianxirenName;
    }
    /**
	 * 获取：联系人
	 */

    public void setLianxirenName(String lianxirenName) {
        this.lianxirenName = lianxirenName;
    }
    /**
	 * 设置：联系人电话
	 */
    public String getLianxirenPhone() {
        return lianxirenPhone;
    }
    /**
	 * 获取：联系人电话
	 */

    public void setLianxirenPhone(String lianxirenPhone) {
        this.lianxirenPhone = lianxirenPhone;
    }
    /**
	 * 设置：物品类型
	 */
    public Integer getWupinTypes() {
        return wupinTypes;
    }
    /**
	 * 获取：物品类型
	 */

    public void setWupinTypes(Integer wupinTypes) {
        this.wupinTypes = wupinTypes;
    }
    /**
	 * 设置：物品数量
	 */
    public Integer getWupinNumber() {
        return wupinNumber;
    }
    /**
	 * 获取：物品数量
	 */

    public void setWupinNumber(Integer wupinNumber) {
        this.wupinNumber = wupinNumber;
    }
    /**
	 * 设置：物品状态
	 */
    public Integer getWupinMaichuTypes() {
        return wupinMaichuTypes;
    }
    /**
	 * 获取：物品状态
	 */

    public void setWupinMaichuTypes(Integer wupinMaichuTypes) {
        this.wupinMaichuTypes = wupinMaichuTypes;
    }
    /**
	 * 设置：物品购买价格
	 */
    public Double getWupinOldMoney() {
        return wupinOldMoney;
    }
    /**
	 * 获取：物品购买价格
	 */

    public void setWupinOldMoney(Double wupinOldMoney) {
        this.wupinOldMoney = wupinOldMoney;
    }
    /**
	 * 设置：出售价格
	 */
    public Double getWupinNewMoney() {
        return wupinNewMoney;
    }
    /**
	 * 获取：出售价格
	 */

    public void setWupinNewMoney(Double wupinNewMoney) {
        this.wupinNewMoney = wupinNewMoney;
    }
    /**
	 * 设置：物品介绍
	 */
    public String getWupinContent() {
        return wupinContent;
    }
    /**
	 * 获取：物品介绍
	 */

    public void setWupinContent(String wupinContent) {
        this.wupinContent = wupinContent;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getWupinDelete() {
        return wupinDelete;
    }
    /**
	 * 获取：逻辑删除
	 */

    public void setWupinDelete(Integer wupinDelete) {
        this.wupinDelete = wupinDelete;
    }
    /**
	 * 设置：发布时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 获取：发布时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }
    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Wupin{" +
            "id=" + id +
            ", yonghuId=" + yonghuId +
            ", wupinName=" + wupinName +
            ", wupinPhoto=" + wupinPhoto +
            ", wupinAddress=" + wupinAddress +
            ", lianxirenName=" + lianxirenName +
            ", lianxirenPhone=" + lianxirenPhone +
            ", wupinTypes=" + wupinTypes +
            ", wupinNumber=" + wupinNumber +
            ", wupinMaichuTypes=" + wupinMaichuTypes +
            ", wupinOldMoney=" + wupinOldMoney +
            ", wupinNewMoney=" + wupinNewMoney +
            ", wupinContent=" + wupinContent +
            ", wupinDelete=" + wupinDelete +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
