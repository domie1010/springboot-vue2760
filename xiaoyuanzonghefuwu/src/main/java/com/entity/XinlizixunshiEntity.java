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
 * 心里咨询师
 *
 * @author 
 * @email
 */
@TableName("xinlizixunshi")
public class XinlizixunshiEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public XinlizixunshiEntity() {

	}

	public XinlizixunshiEntity(T t) {
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
     * 账户
     */
    @TableField(value = "username")

    private String username;


    /**
     * 密码
     */
    @TableField(value = "password")

    private String password;


    /**
     * 咨询师姓名
     */
    @TableField(value = "xinlizixunshi_name")

    private String xinlizixunshiName;


    /**
     * 咨询师手机号
     */
    @TableField(value = "xinlizixunshi_phone")

    private String xinlizixunshiPhone;


    /**
     * 咨询师照片
     */
    @TableField(value = "xinlizixunshi_photo")

    private String xinlizixunshiPhoto;


    /**
     * 擅长
     */
    @TableField(value = "xinlizixunshi_shanchang")

    private String xinlizixunshiShanchang;


    /**
     * 电子邮箱
     */
    @TableField(value = "xinlizixunshi_email")

    private String xinlizixunshiEmail;


    /**
     * 性别
     */
    @TableField(value = "sex_types")

    private Integer sexTypes;


    /**
     * 心理咨询师介绍
     */
    @TableField(value = "xinlizixunshi_content")

    private String xinlizixunshiContent;


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
	 * 设置：账户
	 */
    public String getUsername() {
        return username;
    }
    /**
	 * 获取：账户
	 */

    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 设置：密码
	 */
    public String getPassword() {
        return password;
    }
    /**
	 * 获取：密码
	 */

    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 设置：咨询师姓名
	 */
    public String getXinlizixunshiName() {
        return xinlizixunshiName;
    }
    /**
	 * 获取：咨询师姓名
	 */

    public void setXinlizixunshiName(String xinlizixunshiName) {
        this.xinlizixunshiName = xinlizixunshiName;
    }
    /**
	 * 设置：咨询师手机号
	 */
    public String getXinlizixunshiPhone() {
        return xinlizixunshiPhone;
    }
    /**
	 * 获取：咨询师手机号
	 */

    public void setXinlizixunshiPhone(String xinlizixunshiPhone) {
        this.xinlizixunshiPhone = xinlizixunshiPhone;
    }
    /**
	 * 设置：咨询师照片
	 */
    public String getXinlizixunshiPhoto() {
        return xinlizixunshiPhoto;
    }
    /**
	 * 获取：咨询师照片
	 */

    public void setXinlizixunshiPhoto(String xinlizixunshiPhoto) {
        this.xinlizixunshiPhoto = xinlizixunshiPhoto;
    }
    /**
	 * 设置：擅长
	 */
    public String getXinlizixunshiShanchang() {
        return xinlizixunshiShanchang;
    }
    /**
	 * 获取：擅长
	 */

    public void setXinlizixunshiShanchang(String xinlizixunshiShanchang) {
        this.xinlizixunshiShanchang = xinlizixunshiShanchang;
    }
    /**
	 * 设置：电子邮箱
	 */
    public String getXinlizixunshiEmail() {
        return xinlizixunshiEmail;
    }
    /**
	 * 获取：电子邮箱
	 */

    public void setXinlizixunshiEmail(String xinlizixunshiEmail) {
        this.xinlizixunshiEmail = xinlizixunshiEmail;
    }
    /**
	 * 设置：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }
    /**
	 * 获取：性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 设置：心理咨询师介绍
	 */
    public String getXinlizixunshiContent() {
        return xinlizixunshiContent;
    }
    /**
	 * 获取：心理咨询师介绍
	 */

    public void setXinlizixunshiContent(String xinlizixunshiContent) {
        this.xinlizixunshiContent = xinlizixunshiContent;
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
        return "Xinlizixunshi{" +
            "id=" + id +
            ", username=" + username +
            ", password=" + password +
            ", xinlizixunshiName=" + xinlizixunshiName +
            ", xinlizixunshiPhone=" + xinlizixunshiPhone +
            ", xinlizixunshiPhoto=" + xinlizixunshiPhoto +
            ", xinlizixunshiShanchang=" + xinlizixunshiShanchang +
            ", xinlizixunshiEmail=" + xinlizixunshiEmail +
            ", sexTypes=" + sexTypes +
            ", xinlizixunshiContent=" + xinlizixunshiContent +
            ", createTime=" + createTime +
        "}";
    }
}
