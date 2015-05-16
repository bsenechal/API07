package com.utc.api07.controller;

import java.io.IOException;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.utc.api07.model.Dossier;
import com.utc.api07.model.User;
import com.utc.api07.service.GenericService;

@Controller
public class DossierController {
	private static final String LISTE_DOSSIER = "Dossier/liste";
	private static final String EDIT_DOSSIER = "Dossier/editDossier";
	private static final String MON_DOSSIER = "Dossier/monDossier";
	private static final String MSG_AJOUT_DOSSIER = "Le dossier a correctement été ajouté";
	private static final String MSG_EDIT_DOSSIER =  "Le dossier a correctement été modifié";
	private static final String NO_DOSSIER =  "Vous n'avez pour le moment pas de dossier";
	
    @Autowired
    private MessageSource messageSource;
    
    @Autowired(required = true)
    @Qualifier(value = "dossierService")
    private GenericService<Dossier> dossierService;
    
    @Autowired(required = true)
    @Qualifier(value = "userService")
    private GenericService<User> userService;
    
    @RequestMapping(value = "/dossier/list", method = RequestMethod.GET)
    public ModelAndView listDossier(Locale locale) {

        ModelAndView model = new ModelAndView();
       
        model.addObject("listeDossier", dossierService.list());
        
        model.setViewName(LISTE_DOSSIER);

        return model;
    }

    @RequestMapping(value = "/dossier/add", method = RequestMethod.GET)
    public ModelAndView addDossier(Locale locale) {
    	
        return new ModelAndView(EDIT_DOSSIER).addObject("dossier", new Dossier()).addObject("listUser", this.userService.list());
    }
    
    @RequestMapping(value = "dossier/edit/{idDossier}", method = RequestMethod.GET)
    public ModelAndView editDossier(@PathVariable("idDossier") int idDossier) {

        ModelAndView model = new ModelAndView();
       
        model.addObject("dossier", dossierService.getById(idDossier));
        
        model.addObject("listUser", this.userService.list());
        
        model.setViewName(EDIT_DOSSIER);

        return model;
    }
    
    
    @RequestMapping(value = "/mine", method = RequestMethod.GET)
    public ModelAndView monDossier() {
    	String login = null;
    	User user = null;
    	ModelAndView model = new ModelAndView();
  
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof org.springframework.security.core.userdetails.User){
            login = ((org.springframework.security.core.userdetails.User) principal).getUsername();
            user = userService.getByCriteria("login", login);
        }
        Dossier dossier = dossierService.getByCriteria("fkUser.idUser", user.getIdUser());
        
        if (dossier != null){
        	model.addObject("dossier", dossier);
        } else {
        	model.addObject("dossier", new Dossier());
        	model.addObject("msg", NO_DOSSIER);
        }
        
        model.setViewName(MON_DOSSIER);

        return model;
    }
 
    
    @RequestMapping(value = "/dossier/save", method = RequestMethod.POST)
    public ModelAndView save(@Valid @ModelAttribute("dossier") Dossier d, BindingResult result) throws IOException {
        ModelAndView model = new ModelAndView();

        if (result.hasErrors()) {
            if (d.getIdDossier() != 0){
                model.addObject("dossier", d);
            }
            model.setViewName(EDIT_DOSSIER);
        } else {
            model.setViewName(LISTE_DOSSIER);
            
            if (d.getIdDossier() != 0) {
            	Dossier dossierTmp = dossierService.getById(d.getIdDossier());
            	
            	if (d.getAntecedents() != null && d.getAntecedents() != null)  {
                	dossierTmp.setAntecedents(d.getAntecedents());
                	dossierTmp.setVaccinations(d.getAntecedents());	
            	} else if (d.getCoordonnees() != null && d.getEtatCivil() != null){
            		dossierTmp.setCoordonnees(d.getCoordonnees());
            		dossierTmp.setEtatCivil(d.getEtatCivil());
            		dossierTmp.setFkUser(userService.getById(d.getIdUser()));
            	}
                model.addObject("msg", MSG_EDIT_DOSSIER);

                this.dossierService.update(dossierTmp);
            } else {
                model.addObject("msg", MSG_AJOUT_DOSSIER);
                d.setAntecedents("Aucun antecedent.");
                d.setVaccinations("Aucune vaccination.");
                d.setFkUser(userService.getById(d.getIdUser()));
                this.dossierService.add(d);
            }
            model.addObject("listeDossier", this.dossierService.list());
            model.addObject("listUser", this.userService.list());
        }
        return model;
    }
    
    @Secured("ROLE_EMPLOYE")
    @RequestMapping(value = "/mine/save", method = RequestMethod.POST)
    public ModelAndView saveMine(@Valid @ModelAttribute("dossier") Dossier d, BindingResult result) throws IOException {
        ModelAndView model = new ModelAndView();

        if (result.hasErrors()) {
            if (d.getIdDossier() != 0){
                model.addObject("dossier", d);
            }
            model.setViewName(EDIT_DOSSIER);
        } else {
            model.setViewName("index");
            
            if (d.getIdDossier() != 0) {
            	Dossier dossierTmp = dossierService.getById(d.getIdDossier());
            	
            	if (d.getAntecedents() != null && d.getAntecedents() != null)  {
                	dossierTmp.setAntecedents(d.getAntecedents());
                	dossierTmp.setVaccinations(d.getAntecedents());	
            	} else if (d.getCoordonnees() != null && d.getEtatCivil() != null){
            		dossierTmp.setCoordonnees(d.getCoordonnees());
            		dossierTmp.setEtatCivil(d.getEtatCivil());
            	}

                model.addObject("msg", MSG_EDIT_DOSSIER);

                this.dossierService.update(dossierTmp);
            } else {
            	String login = null;
            	User user = null;
                model.addObject("msg", MSG_AJOUT_DOSSIER);
                d.setAntecedents("Aucun antecedent.");
                d.setVaccinations("Aucune vaccination.");
                
                Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                if (principal instanceof org.springframework.security.core.userdetails.User){
                    login = ((org.springframework.security.core.userdetails.User) principal).getUsername();
                    user = userService.getByCriteria("login", login);
                }
                
                d.setFkUser(user);
                this.dossierService.add(d);
            }
        }
        return model;
    }
}