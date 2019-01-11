package com.ssm.coolalbum.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SafeCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/safecode.action")
	protected void getSafecode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应头 Content-type类型
		response.setContentType("image/jpeg");

		// 以下三句用于设置页面不要缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);

		// 建立指定宽、高和BufferedImage对象
		OutputStream outputStream = response.getOutputStream();
		int width = 100, height = 38;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics(); // 该画笔画在image上
		Color c = g.getColor(); // 保存当前画笔的颜色，用完画笔后要恢复现场
		g.setColor(new Color(242, 242, 242));
		g.fillRect(0, 0, width, height);// 画实心放框
		g.setColor(c);

		// 随即产生的字符串，不包括 i，l(小写L)，o（小写O），1（数字1），0(数字0)
		char[] ch = "abcdefghjkmnpqrstuvwxyz23456789".toCharArray();
		int length = ch.length; // 随机字符串的长度
		String sRand = ""; // 用于保存随机产生的字符串
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			g.setFont(getFont());// 设置字体
			// 在字符串中随机取一个字符依次连接到验证码字符串中
			String rand = new Character(ch[random.nextInt(length)]).toString();
			sRand += rand;
			g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));// 设置随机颜色
			// 使用此图形上下文的当前字体和颜色绘制由此次获得的字符，最左侧字符的基线位于此图形上下文坐标系统的 (x, y) 位置处
			g.drawString(rand, 20 * i + 10, 30);
		}

		// 随机产生干扰点并画在图片上
		for (int i = 0; i < 80; i++) {
			int x1 = random.nextInt(width);
			int y1 = random.nextInt(height);
			g.drawOval(x1, y1, 2, 2);
		}
		g.setColor(c); // 恢复画笔颜色
		g.dispose();// 关闭画笔

		request.getSession().setAttribute("safecode", sRand);// 将验证码字符串记录到session
		ImageIO.write(image, "JPEG", outputStream);// 输出图像到页面
	}

	// 随机产生字体
	private Font getFont() {
		Random random = new Random();
		Font font[] = new Font[5];
		font[0] = new Font("Ravie", Font.PLAIN, 20 + random.nextInt(15));
		font[1] = new Font("Antique Olive Compact", Font.PLAIN, 20 + random.nextInt(15));
		font[2] = new Font("Forte", Font.PLAIN, 20 + random.nextInt(15));
		font[3] = new Font("Wide Latin", Font.PLAIN, 20 + random.nextInt(15));
		font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, 20 + random.nextInt(15));
		return font[random.nextInt(5)];
	}
}
