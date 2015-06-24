package br.senai.sp.wssp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("admin")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping("novo")
	public String novo() {
		return "admin/novo";
	}

	@RequestMapping("menu")
	public String menu() {
		return "admin/menu";
	}

}
