package com.function.iBlog.dao.impl.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.function.iBlog.dao.impl.BaseDao;
import com.function.iBlog.dao.user.UserDao;
import com.function.iBlog.vo.UserVO;

public class UserDaoImpl extends BaseDao implements UserDao
{

    @Override
    public UserVO selectUserByLoginName(String loginName)
    {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("loginName", loginName);
		UserVO ret =sqlSession.selectOne("com.lingcong.mybatis.user.selectUserByLoginName", queryMap);
		return ret;
    }

    @Override
    public UserVO selectUserByID(int userid)
    {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userid", userid);
		UserVO ret =sqlSession.selectOne("com.lingcong.mybatis.user.selectUserByID", queryMap);
		return ret;
    }

    @Override
    public List<UserVO> selectUserByUserInfo(Map<String, Object> queryMap)
    {
		List<UserVO> retList = sqlSession.selectList("com.lingcong.mybatis.user.selectUserByUserInfo", queryMap);
		return retList;
    }

    @Override
    public void changeUserNickName(int userid, String newNickName)
    {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userid", userid);
		queryMap.put("nickName", newNickName);
		sqlSession.update("com.lingcong.mybatis.user.changeUserNickName", queryMap);
	
    }

	@Override
	public boolean changeUserPhoneNum(int userid, String newPhoneNum) {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userid", userid);
		queryMap.put("phoneNum", newPhoneNum);
		sqlSession.update("com.lingcong.mybatis.user.changeUserPhoneNum", queryMap);
		return true;
	}

	@Override
	public boolean changeUserEmail(int userid, String email) {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userid", userid);
		queryMap.put("email", email);
		sqlSession.update("com.lingcong.mybatis.user.changeUserEmail", queryMap);
		return true;
	}

	@Override
	public boolean changeUserFaceImg(int userid, String faceImg) {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userid", userid);
		queryMap.put("faceImg", faceImg);
		sqlSession.update("com.lingcong.mybatis.user.changeUserFaceImg", queryMap);
		return true;
	}

}
