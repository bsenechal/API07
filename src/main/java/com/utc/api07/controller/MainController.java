package com.utc.api07.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    @Autowired
    private MessageSource messageSource;
    
    private static final String CONNECTION_LOGIN_ERROR = "Le login et le mot de passe ne correspondent pas";
    
    
    @RequestMapping(value = { "/", "/index**" }, method = RequestMethod.GET)
    public ModelAndView defaultPage(Model model) {
    	
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            HttpServletRequest request, Locale locale) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error",
                    getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION", locale));
        }	

        if (logout != null) {
            model.addObject("msg", messageSource.getMessage("DECONNECTION", null, locale));
        }
        model.setViewName("login");

        return model;
    }

    // customize the error message
    private String getErrorMessage(HttpServletRequest request, String key, Locale locale) {

        Exception exception = (Exception) request.getSession().getAttribute(key);

        String error = "";
        if (exception instanceof BadCredentialsException) {
        	error =  CONNECTION_LOGIN_ERROR;
        } else if (exception instanceof LockedException) {
            error = exception.getMessage();
        } else {
        	error =  CONNECTION_LOGIN_ERROR;
        }

        return error;
    }
}