package com.lxf.service;

public class SendMail extends Thread {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			int i = 0;
			while(true){
				Thread.sleep(2000);
				System.out.println("正在执行第"+ (i++) + "次扫描，有无任务需要运行！");
				//这里可以去扫描数据库信息，例如有无需要运行的task实例等啊。什么的啊。。。
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
