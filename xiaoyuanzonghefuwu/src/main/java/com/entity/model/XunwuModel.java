package com.entity.model;

import com.entity.XunwuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 寻物
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class XunwuModel implements Serializable {
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
     * 寻物名称
     */
    private String xunwuName;


    /**
     * 寻物照片
     */
    private String xunwuPhoto;


    /**
     * 联系人
     */
    private String lianxirenName;


    /**
     * 联系人手机号
     */
    private String lianxirenPhone;


    /**
     * 寻物类型
     */
    private Integer xunwuTypes;


    /**
     * 寻物状态
     */
    private Integer xunwuZhuangtaiTypes;


    /**
     * 丢失时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date diushiTime;


    /**
     * 丢失地点
     */
    private String diushiAddress;


    /**
     * 特征
     */
    private String diushiTezheng;


    /**
     * 寻物详情
     */
    private String xunwuContent;


    /**
     * 逻辑删除
     */
    private Integer xunwuDelete;


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
	 * 获取：寻物名称
	 */
    public String getXunwuName() {
        return xunwuName;
    }


    /**
	 * 设置：寻物名称
	 */
    public void setXunwuName(String xunwuName) {
        this.xunwuName = xunwuName;
    }
    /**
	 * 获取：寻物照片
	 */
    public String getXunwuPhoto() {
        return xunwuPhoto;
    }


    /**
	 * 设置：寻物照片
	 */
    public void setXunwuPhoto(String xunwuPhoto) {
        this.xunwuPhoto = xunwuPhoto;
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
	 * 获取：联系人手机号
	 */
    public String getLianxirenPhone() {
        return lianxirenPhone;
    }


    /**
	 * 设置：联系人手机号
	 */
    public void setLianxirenPhone(String lianxirenPhone) {
        this.lianxirenPhone = lianxirenPhone;
    }
    /**
	 * 获取：寻物类型
	 */
    public Integer getXunwuTypes() {
        return xunwuTypes;
    }


    /**
	 * 设置：寻物类型
	 */
    public void setXunwuTypes(Integer xunwuTypes) {
        this.xunwuTypes = xunwuTypes;
    }
    /**
	 * 获取：寻物状态
	 */
    public Integer getXunwuZhuangtaiTypes() {
        return xunwuZhuangtaiTypes;
    }


    /**
	 * 设置：寻物状态
	 */
    public void setXunwuZhuangtaiTypes(Integer xunwuZhuangtaiTypes) {
        this.xunwuZhuangtaiTypes = xunwuZhuangtaiTypes;
    }
    /**
	 * 获取：丢失时间
	 */
    public Date getDiushiTime() {
        return diushiTime;
    }


    /**
	 * 设置：丢失时间
	 */
    public void setDiushiTime(Date diushiTime) {
        this.diushiTime = diushiTime;
    }
    /**
	 * 获取：丢失地点
	 */
    public String getDiushiAddress() {
        return diushiAddress;
    }


    /**
	 * 设置：丢失地点
	 */
    public void setDiushiAddress(String diushiAddress) {
        this.diushiAddress = diushiAddress;
    }
    /**
	 * 获取：特征
	 */
    public String getDiushiTezheng() {
        return diushiTezheng;
    }


    /**
	 * 设置：特征
	 */
    public void setDiushiTezheng(String diushiTezheng) {
        this.diushiTezheng = diushiTezheng;
    }
    /**
	 * 获取：寻物详情
	 */
    public String getXunwuContent() {
        return xunwuContent;
    }


    /**
	 * 设置：寻物详情
	 */
    public void setXunwuContent(String xunwuContent) {
        this.xunwuContent = xunwuContent;
    }
    /**
	 * 获取：逻辑删除
	 */
    public Integer getXunwuDelete() {
        return xunwuDelete;
    }


    /**
	 * 设置：逻辑删除
	 */
    public void setXunwuDelete(Integer xunwuDelete) {
        this.xunwuDelete = xunwuDelete;
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
