package com.yong.wf;

import java.io.*;

public class WebFolderDAO {

	private String basepath; // 기본경로
	private String userid; // 사용할 계정정보
	private long totalsize, usedsize, freesize;
	private String crpath;

	public WebFolderDAO() {
		totalsize = 1024 * 1024 * 20;
		usedsize = 0;
		freesize = 0;
	}

	public String getBasepath() {
		return basepath;
	}

	public void setBasepath(String basepath) {
		this.basepath = basepath;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public long getTotalsize() {
		return totalsize;
	}

	public void setTotalsize(long totalsize) {
		this.totalsize = totalsize;
	}

	public long getUsedsize() {
		return usedsize;
	}

	public void setUsedsize(long usedsize) {
		this.usedsize = usedsize;
	}

	public long getFreesize() {
		return freesize;
	}

	public void setFreesize(long freesize) {
		this.freesize = freesize;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	/** 사용자 폴더 만들기 관련 메서드 */
	public void userFolderExists() {

		File f = new File(basepath + "/" + userid);
		if (!f.exists()) {
			f.mkdir();
		}

		usedsize = 0;
		settingUsedSize(f);
		freesize = totalsize - usedsize;
	}

	/** 실제 용량 계산 관련 메서드 */
	public void settingUsedSize(File f) {

		File files[] = f.listFiles();

		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				usedsize += files[i].length();
			} else {
				settingUsedSize(files[i]); // 재귀 함수 호출
			}
		}
	}

	public void addFolder(String path) {
		File f = new File(path);

		if (!f.exists()) {
			f.mkdir();
		}
	}

	public void deleteFile(File f) {

		if (f.isFile()) {
			f.delete();
		} else {
			File files[] = f.listFiles();
			
			if(files.length==0) {
				f.delete();
			}else {
				for (int i = 0; i < files.length; i++) {
					deleteFile(files[i]);
				}
				f.delete();
			}

			
		}

	}
	   /**단일 파일 및 폴더 삭제 관련 메서드*/
	   public void oneFileDelete(String target) { //삭제 하려면 이름있 필요 - string타입 인자 받음 가져오기 위해서
	      File f=new File(basepath+"/"+crpath+"/"+target);//경로를 통해 파일 객체 가져올 것임
	      if(f.isFile()) {
	         f.delete();
	      }else {
	         f.delete(); //파일 하나일 때 삭제되지만 / 폴더는 삭제는 안됨
	      }
	   }
	   
	   /**폴더 일 때 삭제 기능관련메서드*/ //폴더일때이므로 public누구나 접근가능하게함 (삭제할 대상 매개값으로 받음
	   public void deleteFolders(File f) {
	      File files[]=f.listFiles();
	      for(int i=0; i<files.length; i++) {
	         if(files[i].isFile()) {
	            files[i].delete();
	         }else {
	            deleteFolders(files[i]); //기능 반복해서 삭제할 수 있음 메서드 재탕한 것..?
	            files[i].delete();//폴더일때 삭제할 수 있는 녀석 재탕가능함 =
	            
	         }
	      }
	   }

}
