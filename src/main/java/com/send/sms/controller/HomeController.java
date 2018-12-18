package com.send.sms.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.send.sms.pojo.Detail;
import com.send.sms.pojo.Task;
import com.send.sms.pojo.User;
import com.send.sms.service.TelService;
import com.send.sms.service.UserService;
import com.send.sms.utils.RandomNum;

@Controller
public class HomeController {

	@Autowired
	private UserService userservice;
	@Autowired
	private TelService telService;

	@RequestMapping("/upTel")
	public String upTel() {
		return "upTel";
	}

	@RequestMapping("/taskShow")
	public String taskShow() {
		return "taskShow";
	}

	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/toLogin", method = RequestMethod.POST)
	public String toLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {
		User user = userservice.login(username);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("user", user);
				return "main";
			} else {
				model.addAttribute("error", "密码错误");
				return "login";
			}
		} else {
			model.addAttribute("error", "用户不存在");
			return "login";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login";
	}

	@RequestMapping(value = "upTelFile", method = RequestMethod.POST)
	public String upTelFile(@RequestParam("telTxt") MultipartFile file, Task task, HttpSession session, Model model)
			throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line = null;
		// 文件不为空
		if (!file.isEmpty()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line + ",");
			}
			String[] tel = sb.toString().split(",");
			User user = (User) session.getAttribute("user");
			String taskid = RandomNum.getTaskId();
			if(task.getSendTime().equals("")) {
				task.setSendTime(new Date());
			}
			task.setTaskid(taskid);
			telService.upTelFile(task, user.getUsername(), tel);
		}
		return "upTelTip";
	}

	@RequestMapping("showTask")
	public String showTask(Model model,
			@RequestParam(required = false, defaultValue = "1", value = "pageNum") Integer pageNum,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		PageHelper.startPage(pageNum, 20);
		List<Task> tasks = telService.showTask(user.getUsername());
		PageInfo<Task> pageInfo = new PageInfo<>(tasks);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("tasks", tasks);
		return "AllTask";
	}

	@RequestMapping("/getTaskDetail")
	public String getTaskDetail(@RequestParam("taskid") String taskid,
			@RequestParam(required = false, defaultValue = "1", value = "pageNum") Integer pageNum, Model model) {
		PageHelper.startPage(pageNum, 20);
		List<Detail> detailList = telService.showTaskDetailByTaskId(taskid);
		PageInfo<Detail> pageInfo = new PageInfo<>(detailList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("taskid", taskid);
		return "taskShow";
	}

	// 日期查询任务
	@RequestMapping("getSomeTask")
	public String getSomeTask(@RequestParam("begintime") String begintime, @RequestParam("endtime") String endtime,
			@RequestParam(required = false, defaultValue = "1", value = "pageNum") Integer pageNum, Model model) {
		PageHelper.startPage(pageNum, 20);
		List<Task> tasks = telService.getSomeTaskByBeTime(begintime, endtime);
		PageInfo<Task> pageInfo = new PageInfo<>(tasks);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("tasks", tasks);
		return "AllTask";
	}

	@RequestMapping("downloadFile")
	public void downloadFile(HttpServletResponse response,@RequestHeader("User-Agent")String userAgent,String taskid) throws IOException{
		List<String> list =  telService.getTelFile(taskid);
        System.out.println("长度"+list.size());
		String fileName = taskid+".txt";
		String s = ""; 
		OutputStream os = null;
		try {
		    response.reset();
		    response.setContentType("application/octet-stream;multipart/form-data;charset=utf-8");
		    if(userAgent.indexOf("MSIE")>0) {
		    	// 在浏览器提示用户是保存还是下载
		    	 response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		    }else {
		    	response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName);
		    }
		   
		    for(int i=0;i<list.size();i++) {
		    	s += list.get(i)+"\r\n";
		    }
		    byte[] bytes = s.getBytes("GBK");
		    os = response.getOutputStream();
		    // 将字节流传入到响应流里,响应到浏览器
		    os.write(bytes);
		    os.close();   
            os.flush();
		}catch(IOException e){
			e.printStackTrace();   
		}
	}
	@RequestMapping("downResultFile")
	public void downResultFile(HttpServletResponse response,@RequestHeader("User-Agent")String userAgent,String taskid) throws IOException{
		List<Detail> list =  telService.getResultFile(taskid);
        System.out.println("长度"+list.size());
		String fileName = taskid+"result.txt";
		String s = "       任务号          "+"        "+"         电话号             "+"状态：[0:未发送  1:已发送 -1:等待发送]"+"\r\n";   
		OutputStream os = null;  
		Detail detail = null;
		try {
		    response.reset();
		    response.setContentType("application/octet-stream;multipart/form-data;charset=utf-8");
		    if(userAgent.indexOf("MSIE")>0) {
		    	// 在浏览器提示用户是保存还是下载
		    	 response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		    }else {
		    	response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName);
		    }
	
		    for(int i=0;i<list.size();i++) {
		    	detail = list.get(i);
		    	s += detail.getTaskid()+"        "+detail.getTel()+"               "+detail.getFinalstatus()+"\r\n";
		    }
		    byte[] bytes = s.getBytes("GBK");
		    os = response.getOutputStream();
		    // 将字节流传入到响应流里,响应到浏览器
		    os.write(bytes);
		    os.close();   
            os.flush();
		}catch(IOException e){
			e.printStackTrace();     
		}
	}
	
	@RequestMapping("/insert")
	public void insertDetial() {
		telService.insertDetail();      
	}  
}
