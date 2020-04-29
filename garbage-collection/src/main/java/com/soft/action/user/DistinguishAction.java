package com.soft.action.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.soft.model.GarbageType;
import com.soft.service.GarbageTypeService;
import com.soft.util.HttpUtil;
import com.soft.vo.GarbageInfo;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 
 * @ClassName: DistinguishAction 
 * @Description: 垃圾识别功能
 * @author: ljy
 * @date: 2019年12月9日 下午11:37:53
 */
@Controller
@RequestMapping("/distinguish")
public class DistinguishAction {
	
	@Autowired
	private GarbageTypeService garbageTypeService;
	
	
	// 跳转到垃圾识别的界面
	@RequestMapping("toDistinguish")
	public String toDistinguish() {
		return "user/distinguish";
	}
	
	

	/**
	 * 根据关键字判断垃圾类别
	 * 
	 * @param kw 输入的垃圾名称
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public void search(String kw, HttpServletResponse response) throws IOException {
		System.out.println("kw=" + kw);
		String resultData = HttpUtil.sendGet(kw);
		System.out.println("00"+resultData);
		System.err.println("11"+resultData);

		// 将json数据封装为bean
		GarbageInfo info = JSON.parseObject(resultData, GarbageInfo.class);
		System.out.println(info.toString());
		
//		// 获取投放建议
//		GarbageType garbageType = garbageTypeService.ByGarbageTypeName(garbageInfo.getCategory());
//		if(garbageType != null) {
//			garbageInfo.setRemark(garbageType.getGarbagetip());
//		}

		ObjectMapper mapper=new ObjectMapper();
		response.setContentType("application/json;charset=utf-8");
		mapper.writeValue(response.getWriter(),info);

	}
	
}
