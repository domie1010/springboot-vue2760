package com.entity.model;

import com.entity.XinlizixunshiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 心里咨询师
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class XinlizixunshiModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 账户
     */
    private String username;


    /**
     * 密码
     */
    private String password;


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


    /**
     * 擅长
     */
    private String xinlizixunshiShanchang;


    /**
     * 电子邮箱
     */
    private String xinlizixunshiEmail;


    /**
     * 性别
     */
    private Integer sexTypes;


    /**
     * 心理咨询师介绍
     */
    private String xinlizixunshiContent;


    /**
     * 创建时间  show2 photoShow
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
	 * 获取：账户
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 设置：账户
	 */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 获取：密码
	 */
    public String getPassword() {
        return password;
    }


    /**
	 * 设置：密码
	 */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 获取：咨询师姓名
	 */
    public String getXinlizixunshiName() {
        return xinlizixunshiName;
    }


    /**
	 * 设置：咨询师姓名
	 */
    public void setXinlizixunshiName(String xinlizixunshiName) {
        this.xinlizixunshiName = xinlizixunshiName;
    }
    /**
	 * 获取：咨询师手机号
	 */
    public String getXinlizixunshiPhone() {
        return xinlizixunshiPhone;
    }


    /**
	 * 设置：咨询师手机号
	 */
    public void setXinlizixunshiPhone(String xinlizixunshiPhone) {
        this.xinlizixunshiPhone = xinlizixunshiPhone;
    }
    /**
	 * 获取：咨询师照片
	 */
    public String getXinlizixunshiPhoto() {
        return xinlizixunshiPhoto;
    }


    /**
	 * 设置：咨询师照片
	 */
    public void setXinlizixunshiPhoto(String xinlizixunshiPhoto) {
        this.xinlizixunshiPhoto = xinlizixunshiPhoto;
    }
    /**
	 * 获取：擅长
	 */
    public String getXinlizixunshiShanchang() {
        return xinlizixunshiShanchang;
    }


    /**
	 * 设置：擅长
	 */
    public void setXinlizixunshiShanchang(String xinlizixunshiShanchang) {
        this.xinlizixunshiShanchang = xinlizixunshiShanchang;
    }
    /**
	 * 获取：电子邮箱
	 */
    public String getXinlizixunshiEmail() {
        return xinlizixunshiEmail;
    }


    /**
	 * 设置：电子邮箱
	 */
    public void setXinlizixunshiEmail(String xinlizixunshiEmail) {
        this.xinlizixunshiEmail = xinlizixunshiEmail;
    }
    /**
	 * 获取：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 设置：性别
	 */
    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 获取：心理咨询师介绍
	 */
    public String getXinlizixunshiContent() {
        return xinlizixunshiContent;
    }


    /**
	 * 设置：心理咨询师介绍
	 */
    public void setXinlizixunshiContent(String xinlizixunshiContent) {
        this.xinlizixunshiContent = xinlizixunshiContent;
    }
    /**
	 * 获取：创建时间  show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间  show2 photoShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
