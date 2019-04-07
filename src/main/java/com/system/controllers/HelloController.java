package com.system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping(value="/dashboard")
	public ModelAndView hello() {
		ModelAndView model = new ModelAndView("Hello");
		return model;
	}
	@RequestMapping(value="/getStudents", method=RequestMethod.GET)
	public ModelAndView getStudents() {
		ModelAndView model = new ModelAndView("Students");
		return model;
	}
	@RequestMapping(value="/getFaculty", method=RequestMethod.GET)
	public ModelAndView getFaculty() {
		ModelAndView model = new ModelAndView("Faculty");
		return model;
	}
	@RequestMapping(value="/getCourses", method=RequestMethod.GET)
	public ModelAndView getCourses() {
		ModelAndView model = new ModelAndView("Courses");
		return model;
	}
}
