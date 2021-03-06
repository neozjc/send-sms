package com.send.sms.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.send.sms.dao.DetailMapper;
import com.send.sms.dao.TaskMapper;
import com.send.sms.pojo.Detail;
import com.send.sms.pojo.Task;
import com.send.sms.service.TelService;
@Service("telService")
public class TelServiceImpl implements TelService {
	@Autowired
	private TaskMapper taskMapper;
	@Autowired
	private DetailMapper detailMapper;

	//上传文件service
	@Override
	public void upTelFile(Task task,String username,String[] tel) {
		Detail detail = new Detail();
		int length = tel.length;
		task.setStatus("未发送");
		task.setTelnum(length);
		task.setUsername(username);
		//表示未提交发送
		detail.setStatus(0);
		detail.setFinalstatus(-1);  
		detail.setTaskid(task.getTaskid());
		List<Detail> list = new ArrayList<Detail>();
		taskMapper.insert(task);
		for(int i = 0;i<length;i++) {
			detail.setTel(tel[i]);
			list.add(detail);
			//detailMapper.insert(detail);  
		}
		detailMapper.insertBatch(list);        
	}
	@Override
	public List<Task> showTask(String username) {
		List<Task> task = taskMapper.selectTaskByUsername(username);
		return task;  
	}
	@Override
	public List<Detail> showTaskDetailByTaskId(String taskid) {
		List<Detail> list = detailMapper.showTaskDetailByTaskId(taskid);
		return list; 
	}
	@Override
	public List<Task> getSomeTaskByBeTime(String begintime, String endtime) {
		List<Task> tasks= taskMapper.getSomeTaskByBeTime(begintime, endtime);
		return tasks;
	}
	@Override
	public List<String> getTelFile(String taskid) {
		List<String> teList = detailMapper.selectAllTelByTaskId(taskid);
		return teList;
	}
	@Override
	public List<Detail> getResultFile(String taskid) {
		List<Detail> resultList = detailMapper.getResultFile(taskid);
		return resultList; 
	}
	@Override
	public void insertDetail() {
		detailMapper.insertDetail();    
	}
}
