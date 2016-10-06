package com.mpe.portal.web.controllers.center;


import com.mpe.portal.web.controllers.BaseController;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Scope("prototype")
@Controller("DashboardView")
public class DashboardView extends BaseController {

    /**
     * dashboard 视图
     *
     * @return String
     */
    public String dashboardView() {
        this.getRequest().setAttribute("currentUser", this.getCurrentSysUser());
        return "dashboardView";
    }

    public String visit(){
        return "visit";
    }
}
