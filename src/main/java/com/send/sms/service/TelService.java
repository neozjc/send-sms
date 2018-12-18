package com.send.sms.service;

import java.util.List;

import com.send.sms.pojo.Detail;
import com.send.sms.pojo.Task;

public interface TelService {
	
	//上传电话号码
	public void upTelFile(Task task,String username,String tel[]);
	//查询上传信息
	public List<Task> showTask(String username);
	
	//根据任务号查询具体电话信息
	public List<Detail> showTaskDetailByTaskId(String taskid);
	//由begintime和endtime时间查询某些task信息
	List<Task> getSomeTaskByBeTime(String begintime,String endtime);
	
	//下载taskid对应的所有电话号码
	List<String> getTelFile(String taskid);
	//下载任务的发送结果
	public List<Detail> getResultFile(String taskid);
	//下载任务的发送结果 
    public void insertDetail();    
}
