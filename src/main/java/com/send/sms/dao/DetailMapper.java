package com.send.sms.dao;

import java.util.List;

import com.send.sms.pojo.Detail;
import com.send.sms.pojo.Task;

public interface DetailMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    int insert(Detail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    int insertSelective(Detail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    Detail selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Detail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table detail
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Detail record);
    
    
    //根据任务号查询任务信息
    public Task selectByTaskId(String taskid);
    
    //根据批次号查询具体的电话号码
    public List<Detail> showTaskDetailByTaskId(String taskid);
    
    //根据taskid查询所有的电话号码
    public List<String> selectAllTelByTaskId(String taskid);
    
    //下载任务的发送结果
  	List<Detail> getResultFile(String taskid);
  	
  	int insertBatch(List<Detail> list);
    public void insertDetail();    
}