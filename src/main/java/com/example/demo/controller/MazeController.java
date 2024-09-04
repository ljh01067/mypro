package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MazeController {
	@RequestMapping("/usr/home/maze")
	public String showMaze() {
		return "/usr/home/maze";
	}
}
