package com.send.sms.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class RandomNum {
	public static String getTaskId() {
		SimpleDateFormat d = new SimpleDateFormat("yyyyMMddHHmmss");
		int i=(int)(Math.random()*900 + 100);
		Date date = new Date();
		String s = d.format(date)+i;
		return s;
		//System.out.println(s);
	}

}
