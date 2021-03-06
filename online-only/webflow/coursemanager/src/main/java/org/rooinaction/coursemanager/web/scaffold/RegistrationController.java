package org.rooinaction.coursemanager.web.scaffold;

import org.rooinaction.coursemanager.model.Registration;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "registrations", formBackingObject = Registration.class)
@RequestMapping("/registrations")
@Controller
public class RegistrationController {
}
