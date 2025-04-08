package com.entity.model;

import com.entity.WupinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 二手市场
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class WupinModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 用户
     */
    private Integer yonghuId;


    /**
     * 物品名称
     */
    private String wupinName;


    /**
     * 物品照片
     */
    private String wupinPhoto;


    /**
     * 交易地点
     */
    private String wupinAddress;


    /**
     * 联系人
     */
    private String lianxirenName;


    /**
     * 联系人电话
     */
    private String lianxirenPhone;


    /**
     * 物品类型
     */
    private Integer wupinTypes;


    /**
     * 物品数量
     */
    private Integer wupinNumber;


    /**
     * 物品状态
     */
    private Integer wupinMaichuTypes;


    /**
     * 物品购买价格
     */
    private Double wupinOldMoney;


    /**
     * 出售价格
     */
    private Double wupinNewMoney;


    /**
     * 物品介绍
     */
    private String wupinContent;


    /**
     * 逻辑删除
     */
    private Integer wupinDelete;


    /**
     * 发布时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：用户
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：物品名称
	 */
    public String getWupinName() {
        return wupinName;
    }


    /**
	 * 设置：物品名称
	 */
    public void setWupinName(String wupinName) {
        this.wupinName = wupinName;
    }
    /**
	 * 获取：物品照片
	 */
    public String getWupinPhoto() {
        return wupinPhoto;
    }


    /**
	 * 设置：物品照片
	 */
    public void setWupinPhoto(String wupinPhoto) {
        this.wupinPhoto = wupinPhoto;
    }
    /**
	 * 获取：交易地点
	 */
    public String getWupinAddress() {
        return wupinAddress;
    }


    /**
	 * 设置：交易地点
	 */
    public void setWupinAddress(String wupinAddress) {
        this.wupinAddress = wupinAddress;
    }
    /**
	 * 获取：联系人
	 */
    public String getLianxirenName() {
        return lianxirenName;
    }


    /**
	 * 设置：联系人
	 */
    public void setLianxirenName(String lianxirenName) {
        this.lianxirenName = lianxirenName;
    }
    /**
	 * 获取：联系人电话
	 */
    public String getLianxirenPhone() {
        return lianxirenPhone;
    }


    /**
	 * 设置：联系人电话
	 */
    public void setLianxirenPhone(String lianxirenPhone) {
        this.lianxirenPhone = lianxirenPhone;
    }
    /**
	 * 获取：物品类型
	 */
    public Integer getWupinTypes() {
        return wupinTypes;
    }


    /**
	 * 设置：物品类型
	 */
    public void setWupinTypes(Integer wupinTypes) {
        this.wupinTypes = wupinTypes;
    }
    /**
	 * 获取：物品数量
	 */
    public Integer getWupinNumber() {
        return wupinNumber;
    }


    /**
	 * 设置：物品数量
	 */
    public void setWupinNumber(Integer wupinNumber) {
        this.wupinNumber = wupinNumber;
    }
    /**
	 * 获取：物品状态
	 */
    public Integer getWupinMaichuTypes() {
        return wupinMaichuTypes;
    }


    /**
	 * 设置：物品状态
	 */
    public void setWupinMaichuTypes(Integer wupinMaichuTypes) {
        this.wupinMaichuTypes = wupinMaichuTypes;
    }
    /**
	 * 获取：物品购买价格
	 */
    public Double getWupinOldMoney() {
        return wupinOldMoney;
    }


    /**
	 * 设置：物品购买价格
	 */
    public void setWupinOldMoney(Double wupinOldMoney) {
        this.wupinOldMoney = wupinOldMoney;
    }
    /**
	 * 获取：出售价格
	 */
    public Double getWupinNewMoney() {
        return wupinNewMoney;
    }


    /**
	 * 设置：出售价格
	 */
    public void setWupinNewMoney(Double wupinNewMoney) {
        this.wupinNewMoney = wupinNewMoney;
    }
    /**
	 * 获取：物品介绍
	 */
    public String getWupinContent() {
        return wupinContent;
    }


    /**
	 * 设置：物品介绍
	 */
    public void setWupinContent(String wupinContent) {
        this.wupinContent = wupinContent;
    }
    /**
	 * 获取：逻辑删除
	 */
    public Integer getWupinDelete() {
        return wupinDelete;
    }


    /**
	 * 设置：逻辑删除
	 */
    public void setWupinDelete(Integer wupinDelete) {
        this.wupinDelete = wupinDelete;
    }
    /**
	 * 获取：发布时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：发布时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
