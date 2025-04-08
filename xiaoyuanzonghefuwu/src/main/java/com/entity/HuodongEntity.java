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
 * 活动
 *
 * @author 
 * @email
 */
@TableName("huodong")
public class HuodongEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public HuodongEntity() {

	}

	public HuodongEntity(T t) {
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
     * 活动编号
     */
    @TableField(value = "huodong_uuid_number")

    private String huodongUuidNumber;


    /**
     * 活动名称
     */
    @TableField(value = "huodong_name")

    private String huodongName;


    /**
     * 活动照片
     */
    @TableField(value = "huodong_photo")

    private String huodongPhoto;


    /**
     * 活动类型
     */
    @TableField(value = "huodong_types")

    private Integer huodongTypes;


    /**
     * 活动开始日期
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "kaishi_time")

    private Date kaishiTime;


    /**
     * 活动结束日期
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "jieshu_time")

    private Date jieshuTime;


    /**
     * 热度
     */
    @TableField(value = "huodong_clicknum")

    private Integer huodongClicknum;


    /**
     * 活动介绍
     */
    @TableField(value = "huodong_content")

    private String huodongContent;


    /**
     * 逻辑删除
     */
    @TableField(value = "huodong_delete")

    private Integer huodongDelete;


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
	 * 设置：活动编号
	 */
    public String getHuodongUuidNumber() {
        return huodongUuidNumber;
    }
    /**
	 * 获取：活动编号
	 */

    public void setHuodongUuidNumber(String huodongUuidNumber) {
        this.huodongUuidNumber = huodongUuidNumber;
    }
    /**
	 * 设置：活动名称
	 */
    public String getHuodongName() {
        return huodongName;
    }
    /**
	 * 获取：活动名称
	 */

    public void setHuodongName(String huodongName) {
        this.huodongName = huodongName;
    }
    /**
	 * 设置：活动照片
	 */
    public String getHuodongPhoto() {
        return huodongPhoto;
    }
    /**
	 * 获取：活动照片
	 */

    public void setHuodongPhoto(String huodongPhoto) {
        this.huodongPhoto = huodongPhoto;
    }
    /**
	 * 设置：活动类型
	 */
    public Integer getHuodongTypes() {
        return huodongTypes;
    }
    /**
	 * 获取：活动类型
	 */

    public void setHuodongTypes(Integer huodongTypes) {
        this.huodongTypes = huodongTypes;
    }
    /**
	 * 设置：活动开始日期
	 */
    public Date getKaishiTime() {
        return kaishiTime;
    }
    /**
	 * 获取：活动开始日期
	 */

    public void setKaishiTime(Date kaishiTime) {
        this.kaishiTime = kaishiTime;
    }
    /**
	 * 设置：活动结束日期
	 */
    public Date getJieshuTime() {
        return jieshuTime;
    }
    /**
	 * 获取：活动结束日期
	 */

    public void setJieshuTime(Date jieshuTime) {
        this.jieshuTime = jieshuTime;
    }
    /**
	 * 设置：热度
	 */
    public Integer getHuodongClicknum() {
        return huodongClicknum;
    }
    /**
	 * 获取：热度
	 */

    public void setHuodongClicknum(Integer huodongClicknum) {
        this.huodongClicknum = huodongClicknum;
    }
    /**
	 * 设置：活动介绍
	 */
    public String getHuodongContent() {
        return huodongContent;
    }
    /**
	 * 获取：活动介绍
	 */

    public void setHuodongContent(String huodongContent) {
        this.huodongContent = huodongContent;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getHuodongDelete() {
        return huodongDelete;
    }
    /**
	 * 获取：逻辑删除
	 */

    public void setHuodongDelete(Integer huodongDelete) {
        this.huodongDelete = huodongDelete;
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
        return "Huodong{" +
            "id=" + id +
            ", huodongUuidNumber=" + huodongUuidNumber +
            ", huodongName=" + huodongName +
            ", huodongPhoto=" + huodongPhoto +
            ", huodongTypes=" + huodongTypes +
            ", kaishiTime=" + kaishiTime +
            ", jieshuTime=" + jieshuTime +
            ", huodongClicknum=" + huodongClicknum +
            ", huodongContent=" + huodongContent +
            ", huodongDelete=" + huodongDelete +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
