package com.function.iBlog.dao.user;

import java.util.List;
import java.util.Map;

import com.function.iBlog.vo.UserVO;

public interface UserDao
{

    /**
     * 根据用户名查询用户信息
     * @param loginName 登录名  邮箱、手机、用户名均可
     * @return
     */
    public UserVO selectUserByLoginName(String loginName);

    /**
     * 根据用户ID查询用户信息
     * @param userid  用户ID
     * @return
     */
    public UserVO selectUserByID(int userid);

    /**
     * 根据用户信息查询用户列表
     * @param map
     *        	complete_nickName  完整的昵称
     *          part_nickName      部分昵称
     *          complete_userName  完整的用户名
     *          part_userName      部分用户名
     *          part_phone         部分手机号
     *          part_email         部分邮箱地址
     * @return
     */
    public List<UserVO> selectUserByUserInfo(Map<String, Object> map);

    /**
     * 根据ID修改用户昵称
     * @param userid   用户ID
     * @param newNickName  新的用户昵称
     */
    public void changeUserNickName(int userid, String newNickName);

    /**
     * 根据ID修改用户手机号
     * @param userid
     * @param newPhoneNum
     * @return
     */
	public boolean changeUserPhoneNum(int userid, String newPhoneNum);

	/**
	 * 根据ID修改用户邮箱地址
	 * @param userid
	 * @param email
	 * @return
	 */
	public boolean changeUserEmail(int userid, String email);

	/**
	 * 根据ID修改用户头像
	 * @param userid
	 * @param faceImg
	 * @return
	 */
	public boolean changeUserFaceImg(int userid, String faceImg);

}
